import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nectar/core/core.dart';
import 'package:nectar/cubit/controllers/products_controller.dart';
import 'package:nectar/cubit/states/products_state.dart';
import 'package:nectar/features/home/presenattion/widgets/offer_widget.dart';
import 'package:nectar/features/home/presenattion/widgets/skeleton_list_view.dart';
import 'package:nectar/features/search/search_page.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

bool isLoading = true;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsController>().fetchAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<ProductsController, ProductsState>(
          builder: (context, state) {
            bool isLoading = state is ProductsLoading;
            return Skeletonizer(
              enabled: isLoading,
              enableSwitchAnimation: true,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.semilargeHorizontalPadding,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: AppSizes.smallVerticalPadding,
                          ),
                          child: !isLoading
                              ? SvgPicture.asset(AppAssets.coloredCarrot)
                              : Shimmer.fromColors(
                                  baseColor: AppColors.skeletonBase,
                                  highlightColor: AppColors.skeletonBase,
                                  child: CircleAvatar(
                                    radius: AppSizes.carrotRadius,
                                  ),
                                ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: AppSizes.semilargeVerticalPadding,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: AppColors.subtitleColor,
                              ),
                              Text(
                                "Dhake, Banassre",
                                style: theme.labelSmall,
                              ), //!need to be connected to database
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchPage(),
                              ),
                            );
                          },
                          child: IgnorePointer(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Search Store",
                                hintStyle: theme.bodySmall,
                                filled: true,
                                fillColor: AppColors.searchFieldColor,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: AppColors.titleColor,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(AppSizes.homeRadius),
                                  ),
                                  borderSide: BorderSide(
                                    color: AppColors.searchFieldColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        OfferWidget(isLoading: isLoading),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Exclusive offer", style: theme.headlineMedium),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "See All",
                                style: theme.titleSmall!.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppSizes.cardHeight,
                    width: double.infinity,
                    child: state is ProductsLoaded
                        ? ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.products.length,
                            separatorBuilder: (context, index) =>
                                SizedBox(width: AppSizes.smallHorizontalSpace),
                            itemBuilder: (context, index) {
                              return ProductCard(
                                product: state.products[index],
                              );
                            },
                          )
                        : SkeletonListView(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
