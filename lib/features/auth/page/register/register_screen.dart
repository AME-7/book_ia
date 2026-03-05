import 'package:book_ia/core/constants/app_images.dart';
import 'package:book_ia/core/styles/colors.dart';
import 'package:book_ia/core/styles/text_style.dart';
import 'package:book_ia/core/utils/validators.dart';
import 'package:book_ia/core/widget/custom_svg_picture.dart';
import 'package:book_ia/core/widget/custom_text_form_field.dart';
import 'package:book_ia/core/widget/main_button.dart';
import 'package:book_ia/core/widget/password_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();

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
                  'Hello! Register to get started',
                  style: AppTextStyle.headline,
                ),

                const Gap(32),

                CustomTextFormField(
                  controller: nameController,
                  hintText: 'Username',
                  keybordType: TextInputType.name,
                  validator: AppValidator.name,
                ),

                const Gap(15),

                CustomTextFormField(
                  controller: emailController,
                  hintText: 'Email',
                  keybordType: TextInputType.emailAddress,
                  validator: AppValidator.email,
                ),

                const Gap(15),

                PasswordTextFormField(
                  controller: passwordController,
                  hintText: 'Password',
                  validator: null,
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
                  text: 'Register',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                ),
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
            Text('Already have an account?', style: AppTextStyle.captoin1),
            const Gap(10),
            GestureDetector(
              onTap: () {},
              child: Text(
                'Login Now',
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
