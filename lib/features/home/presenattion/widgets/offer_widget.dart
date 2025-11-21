import 'package:flutter/material.dart';
import 'package:nectar/core/core.dart';
import 'package:nectar/data/models/offer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OfferWidget extends StatefulWidget {
  const OfferWidget({super.key, required this.isLoading});

  final bool isLoading;
  @override
  State<OfferWidget> createState() => _OfferWidgetState();
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

class _OfferWidgetState extends State<OfferWidget> {
  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Padding(
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
                    borderRadius: BorderRadius.all(Radius.circular(18)),
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
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          offers[i].title,
                          style: theme.titleSmall!.copyWith(
                            color: Color.fromARGB(255, 226, 107, 101),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (!widget.isLoading)
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
    );
  }
}
