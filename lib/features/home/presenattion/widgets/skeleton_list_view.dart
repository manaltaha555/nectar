import 'package:flutter/material.dart';
import 'package:nectar/core/core.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonListView extends StatelessWidget {
  const SkeletonListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      separatorBuilder: (context, index) => SizedBox(width: 10),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: AppColors.skeletonBase,
          highlightColor: AppColors.skeletonBase,
          child: Card(
            color: AppColors.skeletonBase,
            child: SizedBox(width: 220, height: 250),
          ),
        );
      },
    );
  }
}
