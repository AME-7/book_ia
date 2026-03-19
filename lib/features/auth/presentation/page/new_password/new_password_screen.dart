import 'dart:developer';

import 'package:book_ia/core/constants/app_images.dart';
import 'package:book_ia/core/functions/navigations.dart';
import 'package:book_ia/core/routes/routes.dart';
import 'package:book_ia/core/styles/colors.dart';
import 'package:book_ia/core/styles/text_style.dart';
import 'package:book_ia/core/utils/validators.dart';
import 'package:book_ia/core/widget/custom_svg_picture.dart';
import 'package:book_ia/core/widget/dialogs.dart';
import 'package:book_ia/core/widget/main_button.dart';
import 'package:book_ia/core/widget/password_text_form_field.dart';
import 'package:book_ia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:book_ia/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
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
        body: _newPasswordBody(),
      ),
    );
  }

  Widget _newPasswordBody() {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          pop(context);
          log('success');
        } else if (state is AuthErrorState) {
          pop(context);
          showMyDialog(context, state.message);
        } else if (state is AuthLodingState) {
          showLoadingDialog(context);
        }
      },
      builder: (context, state) {
        var cubit = context.read<AuthCubit>();
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Form(
              key: cubit.formKey,
              child: Column(
                children: [
                  Text('Create new password', style: AppTextStyle.headline),
                  Gap(15),
                  Text(
                    'Your new password must be unique from those previously used.',
                    style: AppTextStyle.body.copyWith(
                      color: AppColors.greyColor,
                    ),
                  ),

                  const Gap(32),
                  PasswordTextFormField(
                    controller: cubit.passwordController,
                    hintText: 'New Password',
                    validator: AppValidator.password,
                  ),

                  const Gap(15),

                  PasswordTextFormField(
                    controller: cubit.confirmPasswordController,
                    hintText: 'Confirm password',
                    validator: (value) => AppValidator.confirmPassword(
                      value,
                      cubit.confirmPasswordController.text,
                    ),
                  ),

                  const Gap(30),

                  MainButton(
                    text: 'Reset Password',
                    onPressed: () {
                      if (cubit.formKey.currentState!.validate()) {
                        pushTo(context, Routes.passwordChaged);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
