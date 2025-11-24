import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    imagePath: AppAssets.firstOffer,
    title: AppStrings.titleFirstOffer,
    description: AppStrings.descriptionFirstOffer,
  ),
  Offer(
    imagePath: AppAssets.secondOffer,
    title: AppStrings.titleSecondOffer,
    description: AppStrings.descriptionSecondOffer,
  ),
  Offer(
    imagePath: AppAssets.thirdOffer,
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
      padding: EdgeInsets.symmetric(vertical: AppSizes.mediumVerticalPadding),
      child: SizedBox(
        height: AppSizes.offerHeight,
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
                      Radius.circular(AppSizes.homeRadius),
                    ),
                    image: DecorationImage(
                      image: AssetImage(offers[i].imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 16.h,
                  right: 16.w,
                  child: Column(
                    children: [
                      Text(
                        offers[i].description,
                        style: theme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: AppSizes.smallVerticalPadding,
                        ),
                        child: Text(
                          offers[i].title,
                          style: theme.titleSmall!.copyWith(
                            color: AppColors.offerTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (!widget.isLoading)
                  Positioned(
                    bottom: 10.h,
                    child: AnimatedSmoothIndicator(
                      activeIndex: index,
                      count: offers.length,
                      effect: ExpandingDotsEffect(
                        dotColor: AppColors.dotColor,
                        activeDotColor: AppColors.primaryColor,
                        expansionFactor: 2.0,
                        dotHeight: AppSizes.dotHeight,
                        dotWidth: AppSizes.dotWidth,
                        spacing: AppSizes.dotSpaces,
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
