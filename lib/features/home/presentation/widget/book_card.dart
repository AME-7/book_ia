import 'package:book_ia/core/constants/app_images.dart';
import 'package:book_ia/core/styles/colors.dart';
import 'package:book_ia/core/styles/text_style.dart';
import 'package:book_ia/core/widget/main_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.secondaryColor,
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10),
              child: Image.asset(
                AppImages.bg,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Gap(10),
          Text('The Psychology of money', style: AppTextStyle.body),
          Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$25', style: AppTextStyle.body),
              SizedBox(
                height: 30,
                child: MainButton(
                  minWigth: 70,
                  minHeight: 30,
                  text: 'bay',
                  onPressed: () {},
                  bgColor: AppColors.blackColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
