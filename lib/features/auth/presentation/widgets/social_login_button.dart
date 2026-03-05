import 'package:book_ia/core/constants/app_images.dart';
import 'package:book_ia/core/styles/colors.dart';
import 'package:book_ia/core/styles/text_style.dart';
import 'package:book_ia/core/widget/custom_svg_picture.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider()),
            Gap(20),
            Text('Or', style: AppTextStyle.captoin1),
            Gap(20),
            Expanded(child: Divider()),
          ],
        ),
        Gap(20),
        Column(
          children: [
            SocialButton(
              text: 'Login with Google',
              path: AppImages.googleSvg,
              onTap: () {},
            ),
            Gap(15),
            SocialButton(
              path: AppImages.appleSvg,
              text: 'login with Apple',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.text,
    required this.path,
    required this.onTap,
  });
  final String path;
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.accentColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSvgPicture(path: path),
            Gap(10),
            Text(
              text,
              style: AppTextStyle.captoin1.copyWith(color: AppColors.greyColor),
            ),
          ],
        ),
      ),
    );
  }
}
