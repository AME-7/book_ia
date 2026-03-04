import 'package:book_ia/core/constants/app_images.dart';
import 'package:book_ia/core/functions/navigations.dart';
import 'package:book_ia/core/styles/colors.dart';
import 'package:book_ia/core/styles/text_style.dart';
import 'package:book_ia/core/widget/custom_svg_picture.dart';
import 'package:book_ia/core/widget/main_button.dart';
import 'package:book_ia/features/auth/page/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.bg,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          Positioned(
            top: 0,
            right: 22,
            left: 22,
            bottom: 0,
            child: Column(
              children: [
                Spacer(flex: 2),
                CustomSvgPicture(path: AppImages.logoSvg),
                Gap(10),
                Text('Order Your Book Now!', style: AppTextStyle.subtitle1),
                Spacer(flex: 4),
                MainButton(
                  text: 'login',
                  onPressed: () {
                    pushTo(context, LoginScreen());
                  },
                  bgColor: AppColors.primaryColor,
                ),
                Gap(15),
                MainButton(
                  text: 'Register',
                  onPressed: () {},
                  bgColor: AppColors.backgroundColor,
                  textColor: AppColors.blackColor,
                  borderColor: AppColors.blackColor,
                ),
                Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
