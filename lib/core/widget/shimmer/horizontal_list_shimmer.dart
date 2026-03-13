import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:book_ia/core/styles/colors.dart';

class HorizontalListShimmer extends StatelessWidget {
  final int itemCount;
  final double itemWidth;
  final double itemHeight;
  final double spacing;

  const HorizontalListShimmer({
    super.key,
    this.itemCount = 5,
    this.itemWidth = 150,
    this.itemHeight = 200,
    this.spacing = 10,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: itemHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? spacing : spacing / 2,
              right: index == itemCount - 1 ? spacing : spacing / 2,
            ),
            child: Shimmer.fromColors(
              baseColor: AppColors.accentColor,
              highlightColor: AppColors.secondaryColor,
              child: Container(
                width: itemWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.secondaryColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
