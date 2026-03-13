import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:gap/gap.dart';
import 'package:book_ia/core/styles/colors.dart';

class BookCardShimmer extends StatelessWidget {
  const BookCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.accentColor,
      highlightColor: AppColors.secondaryColor,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.secondaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: double.infinity,
                  color: AppColors.accentColor,
                ),
              ),
            ),
            const Gap(10),
            // Title shimmer
            Container(height: 16, color: AppColors.accentColor),
            const Gap(5),
            // Subtitle shimmer
            Container(height: 16, width: 150, color: AppColors.accentColor),
            const Gap(10),
            // Price and button row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Price placeholder
                SizedBox(
                  height: 45,
                  child: Container(width: 80, color: AppColors.accentColor),
                ),
                // Button placeholder
                SizedBox(
                  height: 30,
                  child: Container(
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.accentColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
