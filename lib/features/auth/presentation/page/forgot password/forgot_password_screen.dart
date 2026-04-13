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
import 'package:book_ia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:book_ia/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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

      body: _forgotPasswordBody(),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(22, 5, 22, 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Remember Password?', style: AppTextStyle.captoin1),

            const Gap(10),

            GestureDetector(
              onTap: () {
                pushTo(context, Routes.login);
              },
              child: Text(
                'Login',
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

  Widget _forgotPasswordBody() {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          pushTo(context, Routes.otp);
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Forgot Password?', style: AppTextStyle.headline),

                  Gap(15),
                  Text(
                    'Don\'t worry! It occurs. Please enter the email address linked with your account.',
                    style: AppTextStyle.body.copyWith(
                      color: AppColors.greyColor,
                    ),
                  ),

                  const Gap(32),

                  CustomTextFormField(
                    controller: cubit.emailController,
                    hintText: 'Enter your email',
                    keybordType: TextInputType.emailAddress,
                    validator: AppValidator.email,
                  ),

                  const Gap(30),

                  MainButton(
                    text: 'Send Code',
                    onPressed: () {
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.forgot();
                      }
                    },
                  ),

                  const Gap(35),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
