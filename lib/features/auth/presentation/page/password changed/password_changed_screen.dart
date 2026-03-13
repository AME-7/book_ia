import 'package:book_ia/core/constants/app_images.dart';
import 'package:book_ia/core/functions/navigations.dart';
import 'package:book_ia/core/routes/routes.dart';
import 'package:book_ia/core/styles/colors.dart';
import 'package:book_ia/core/styles/text_style.dart';
import 'package:book_ia/core/widget/custom_svg_picture.dart';
import 'package:book_ia/core/widget/main_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

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

              Text('Password Changed!', style: AppTextStyle.headline),

              Gap(15),
              Text(
                'Your password has been changed successfully.',
                style: AppTextStyle.body.copyWith(color: AppColors.greyColor),
              ),
              Gap(50),

              MainButton(
                text: 'Back to Login',
                onPressed: () {
                  pushTo(context, Routes.login);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
