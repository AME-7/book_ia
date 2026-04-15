import 'package:book_ia/core/constants/app_images.dart';
import 'package:book_ia/core/functions/navigations.dart';
import 'package:book_ia/core/routes/routes.dart';
import 'package:book_ia/core/styles/colors.dart';
import 'package:book_ia/core/styles/text_style.dart';
import 'package:book_ia/core/widget/custom_svg_picture.dart';
import 'package:book_ia/core/widget/dialogs.dart';
import 'package:book_ia/core/widget/main_button.dart';

import 'package:book_ia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:book_ia/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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

      body: _otpBody(),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(22, 5, 22, 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Didn\'t receive code?', style: AppTextStyle.captoin1),

            const Gap(10),

            GestureDetector(
              onTap: () {
                context.read()<AuthCubit>().resendCode;
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

  Widget _otpBody() {
    final formKey = GlobalKey<FormState>(); // ✅ أضف ده

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLodingState) {
          showLoadingDialog(context);
        } else if (state is AuthSuccessState) {
          Navigator.of(context).maybePop();
          pushTo(context, Routes.nawPassword);
        } else if (state is AuthErrorState) {
          Navigator.of(context).maybePop();
          showMyDialog(context, state.message);
        }
      },
      builder: (context, state) {
        var cubit = context.read<AuthCubit>();
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Form(
              key: formKey, // ✅ بدل cubit.formKey
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('OTP Verification', style: AppTextStyle.headline),
                  const Gap(15),
                  Text(
                    'Enter the verification code we just sent on your email address.',
                    style: AppTextStyle.body.copyWith(
                      color: AppColors.greyColor,
                    ),
                  ),
                  const Gap(32),
                  Align(
                    alignment: Alignment.center,
                    child: Pinput(
                      length: 6,
                      onChanged: (value) {
                        cubit.otp = value;
                      },
                      onCompleted: (pin) {
                        cubit.otp = pin;
                      },
                    ),
                  ),
                  const Gap(30),
                  MainButton(
                    text: 'Verify',
                    onPressed: () {
                      if (cubit.otp.length == 6) {
                        cubit.verifyOtp(); // ✅ بس كدا
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Enter valid OTP")),
                        );
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
