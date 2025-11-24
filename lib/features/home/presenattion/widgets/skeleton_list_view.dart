import 'package:flutter/material.dart';
import 'package:nectar/core/core.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonListView extends StatelessWidget {
  const SkeletonListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      separatorBuilder: (context, index) =>
          SizedBox(width: AppSizes.smallHorizontalSpace),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: AppColors.skeletonBase,
          highlightColor: AppColors.skeletonBase,
          child: Card(
            color: AppColors.skeletonBase,
            child: SizedBox(
              width: AppSizes.skeletonCardWidth,
              height: AppSizes.skeletonCardHeight,
            ),
          ),
        );
      },
    );
  }
}
