import 'package:book_ia/core/constants/app_images.dart';
import 'package:book_ia/core/functions/navigations.dart';
import 'package:book_ia/core/styles/colors.dart';
import 'package:book_ia/core/styles/text_style.dart';
import 'package:book_ia/core/widget/custom_svg_picture.dart';
import 'package:book_ia/core/widget/main_button.dart';
import 'package:book_ia/features/auth/presentation/page/forgot%20password/forgot_password_screen.dart';
import 'package:book_ia/features/auth/presentation/page/login/login_screen.dart';
import 'package:book_ia/features/auth/presentation/page/new_password/new_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreen();
}

class _OtpScreen extends State<OtpScreen> {
  final emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            popTo(context, ForgotPasswordScreen());
          },
          child: CustomSvgPicture(path: AppImages.backSvg),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),

          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('OTP Verification', style: AppTextStyle.headline),

                Gap(15),
                Text(
                  'Enter the verification code we just sent on your email address.',
                  style: AppTextStyle.body.copyWith(color: AppColors.greyColor),
                ),

                const Gap(32),
                Align(
                  alignment: Alignment.center,
                  child: Pinput(
                    length: 5,
                    mainAxisAlignment: MainAxisAlignment.center,
                    onChanged: (value) {},
                    onCompleted: (pin) {
                      debugPrint('OTP Completed $pin');
                    },
                  ),
                ),

                const Gap(30),

                MainButton(
                  text: 'Verify',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      pushTo(context, NewPasswordScreen());
                    }
                  },
                ),

                const Gap(35),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(22, 5, 22, 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Don\'t received code?', style: AppTextStyle.captoin1),

            const Gap(10),

            GestureDetector(
              onTap: () {
                pushTo(context, const LoginScreen());
              },
              child: Text(
                'Resend',
                style: AppTextStyle.captoin1.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
