import 'package:book_ia/core/constants/app_images.dart';
import 'package:book_ia/core/functions/navigations.dart';
import 'package:book_ia/core/routes/routes.dart';
import 'package:book_ia/core/styles/colors.dart';
import 'package:book_ia/core/styles/text_style.dart';
import 'package:book_ia/core/widget/custom_svg_picture.dart';
import 'package:book_ia/core/widget/main_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SucceseScreen extends StatelessWidget {
  const SucceseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSvgPicture(path: AppImages.successSvg),
              Gap(15),

              Text('SUCCESS!', style: AppTextStyle.headline),

              Gap(15),
              Text(
                'Your order will be delivered soon. Thank you for choosing our app!',
                textAlign: TextAlign.center,
                style: AppTextStyle.body.copyWith(color: AppColors.greyColor),
              ),
              Gap(50),

              MainButton(
                text: 'Back To Home',
                onPressed: () {
                  pushTo(context, Routes.main);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
