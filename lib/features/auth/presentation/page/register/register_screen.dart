import 'package:book_ia/core/constants/app_images.dart';
import 'package:book_ia/core/functions/navigations.dart';
import 'package:book_ia/core/routes/routes.dart';
import 'package:book_ia/core/styles/colors.dart';
import 'package:book_ia/core/styles/text_style.dart';
import 'package:book_ia/core/utils/validators.dart';
import 'package:book_ia/core/widget/custom_svg_picture.dart';
import 'package:book_ia/core/widget/custom_text_form_field.dart';
import 'package:book_ia/core/widget/dialogs.dart';
import 'package:book_ia/core/widget/main_button.dart';
import 'package:book_ia/core/widget/password_text_form_field.dart';
import 'package:book_ia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:book_ia/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            pop(context);
          },
          child: CustomSvgPicture(path: AppImages.backSvg),
        ),
      ),
      body: _registerBody(context),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(22, 5, 22, 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Already have an account?', style: AppTextStyle.captoin1),
            const Gap(10),
            GestureDetector(
              onTap: () {
                pushTo(context, Routes.login);
              },
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

  Widget _registerBody(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          pushToBase(context, Routes.main);
        } else if (state is AuthErrorState) {
          pop(context);
          showMyDialog(context, state.message);
        } else if (state is AuthLodingState) {
          showLoadingDialog(context);
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Form(
            key: cubit.formKey,
            child: Column(
              children: [
                Text(
                  'Hello! Register to get started',
                  style: AppTextStyle.headline,
                ),

                const Gap(32),

                CustomTextFormField(
                  controller: cubit.nameController,
                  hintText: 'Username',
                  keybordType: TextInputType.name,
                  validator: AppValidator.name,
                ),

                const Gap(15),

                CustomTextFormField(
                  controller: cubit.emailController,
                  hintText: 'Email',
                  keybordType: TextInputType.emailAddress,
                  validator: AppValidator.email,
                ),

                const Gap(15),

                PasswordTextFormField(
                  controller: cubit.passwordController,
                  hintText: 'Password',
                  validator: AppValidator.password,
                ),

                const Gap(15),

                PasswordTextFormField(
                  controller: cubit.confirmPasswordController,
                  hintText: 'Confirm password',
                  validator: (value) => AppValidator.confirmPassword(
                    value,
                    cubit.passwordController.text,
                  ),
                ),

                const Gap(30),

                MainButton(
                  text: 'Register',
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.register();
                    }
                  },
                ),

                Gap(35),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
