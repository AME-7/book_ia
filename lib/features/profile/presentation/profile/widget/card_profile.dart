import 'package:book_ia/core/constants/app_images.dart';
import 'package:book_ia/core/styles/colors.dart';
import 'package:book_ia/core/styles/text_style.dart';
import 'package:book_ia/core/widget/custom_svg_picture.dart';
import 'package:flutter/material.dart';

class CardProfile extends StatelessWidget {
  const CardProfile({super.key, required this.text, this.onTap});

  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: Card(
          elevation: 6,
          shadowColor: AppColors.blackColor.withValues(alpha: .8),
          color: AppColors.backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text, style: AppTextStyle.body),
                CustomSvgPicture(path: AppImages.vectorSvg),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
