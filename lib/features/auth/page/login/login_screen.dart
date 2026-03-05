import 'package:book_ia/core/constants/app_images.dart';
import 'package:book_ia/core/functions/navigations.dart';
import 'package:book_ia/core/styles/colors.dart';
import 'package:book_ia/core/styles/text_style.dart';
import 'package:book_ia/core/utils/validators.dart';
import 'package:book_ia/core/widget/custom_svg_picture.dart';
import 'package:book_ia/core/widget/custom_text_form_field.dart';
import 'package:book_ia/core/widget/main_button.dart';
import 'package:book_ia/core/widget/password_text_form_field.dart';
import 'package:book_ia/features/auth/page/register/register_screen.dart';
import 'package:book_ia/features/auth/widgets/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: CustomSvgPicture(path: AppImages.backSvg),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),

          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  'Welcome back! Glad to see you again!',
                  style: AppTextStyle.headline,
                ),

                const Gap(32),

                CustomTextFormField(
                  controller: emailController,
                  hintText: 'Enter your email',
                  keybordType: TextInputType.emailAddress,
                  validator: AppValidator.email,
                ),

                const Gap(15),

                PasswordTextFormField(
                  controller: passwordController,
                  hintText: 'Enter your password',
                  validator: null,
                ),

                const Gap(15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Forgot password',
                        style: AppTextStyle.captoin1.copyWith(
                          color: AppColors.greyColor,
                        ),
                      ),
                    ),
                  ],
                ),

                const Gap(30),

                MainButton(
                  text: 'Login',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                ),

                const Gap(35),

                const SocialLoginButton(),
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
            Text('Don\'t have an account?', style: AppTextStyle.captoin1),

            const Gap(10),

            GestureDetector(
              onTap: () {
                pushTo(context, const RegisterScreen());
              },
              child: Text(
                'Register',
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
