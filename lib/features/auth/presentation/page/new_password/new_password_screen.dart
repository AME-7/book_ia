import 'package:book_ia/core/constants/app_images.dart';
import 'package:book_ia/core/functions/navigations.dart';
import 'package:book_ia/core/styles/colors.dart';
import 'package:book_ia/core/styles/text_style.dart';
import 'package:book_ia/core/utils/validators.dart';
import 'package:book_ia/core/widget/custom_svg_picture.dart';
import 'package:book_ia/core/widget/main_button.dart';
import 'package:book_ia/core/widget/password_text_form_field.dart';
import 'package:book_ia/features/auth/presentation/page/otp/otp_screen.dart';
import 'package:book_ia/features/auth/presentation/page/password%20changed/password_changed_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreen();
}

class _NewPasswordScreen extends State<NewPasswordScreen> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            popTo(context, OtpScreen());
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
              children: [
                Text('Create new password', style: AppTextStyle.headline),
                Gap(15),
                Text(
                  'Your new password must be unique from those previously used.',
                  style: AppTextStyle.body.copyWith(color: AppColors.greyColor),
                ),

                const Gap(32),
                PasswordTextFormField(
                  controller: passwordController,
                  hintText: 'New Password',
                  validator: AppValidator.password,
                ),

                const Gap(15),

                PasswordTextFormField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm password',
                  validator: (value) => AppValidator.confirmPassword(
                    value,
                    passwordController.text,
                  ),
                ),

                const Gap(30),

                MainButton(
                  text: 'Reset Password',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      pushTo(context, PasswordChangedScreen());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
