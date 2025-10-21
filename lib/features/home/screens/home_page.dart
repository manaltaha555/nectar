import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar/Logic/products_view_model.dart';
import 'package:nectar/core/constants/app_strings.dart';
import 'package:nectar/core/core.dart';
import 'package:nectar/data/models/offer.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Offer> offers = [
  Offer(
    imagePath: AppImages.firstOffer,
    title: AppStrings.titleFirstOffer,
    description: AppStrings.descriptionFirstOffer,
  ),
  Offer(
    imagePath: AppImages.secondOffer,
    title: AppStrings.titleSecondOffer,
    description: AppStrings.descriptionSecondOffer,
  ), 
  Offer(
    imagePath: AppImages.thirdOffer,
    title: AppStrings.titleThirdOffer,
    description: AppStrings.descriptionThirdOffer,
  ),
];
int index = 0;
bool isLoading = true;
ProductsViewModel productsViewModel = ProductsViewModel();

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    await productsViewModel.fetchProducts();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SafeArea(
            child: Skeletonizer(
              enabled: isLoading,
              enableSwitchAnimation: true,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SvgPicture.asset(AppImages.coloredCarrot),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on, color: AppColors.subtitleColor),
                        Text("Dhake, Banassre", style: theme.labelSmall),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: IgnorePointer(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Search Store",
                          hintStyle: theme.titleSmall!.copyWith(fontSize: 14),
                          filled: true,
                          fillColor: AppColors.searchFieldColor,
                          prefixIcon: Icon(
                            Icons.search,
                            color: AppColors.titleColor,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: AppColors.searchFieldColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: SizedBox(
                      height: 200,
                      child: PageView.builder(
                        onPageChanged: (int newIndex) {
                          setState(() {
                            index = newIndex;
                          });
                        },
                        itemCount: offers.length,
                        itemBuilder: (context, i) {
                          return Stack(
                            alignment: AlignmentGeometry.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(18),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(offers[i].imagePath),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 16,
                                right: 16,
                                child: Column(
                                  children: [
                                    Text(
                                      offers[i].description,
                                      style: theme.labelLarge!.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      child: Text(
                                        offers[i].title,
                                        style: theme.titleSmall!.copyWith(
                                          color: Color.fromARGB(
                                            255,
                                            226,
                                            107,
                                            101,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                child: AnimatedSmoothIndicator(
                                  activeIndex: index,
                                  count: offers.length,
                                  effect: ExpandingDotsEffect(
                                    dotColor: AppColors.dotColor,
                                    activeDotColor: AppColors.primaryColor,
                                    expansionFactor: 2.0,
                                    dotHeight: 10,
                                    dotWidth: 10,
                                    spacing: 8,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Exclusive offer", style: theme.headlineLarge),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "See All",
                          style: theme.titleSmall!.copyWith(
                            color: AppColors.primaryColor
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: productsViewModel.productsList.length,
                      separatorBuilder: (context, index) => SizedBox(width: 10),
                      itemBuilder: (context, index) {
                        return ProductCard(
                          product: productsViewModel.productsList[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
