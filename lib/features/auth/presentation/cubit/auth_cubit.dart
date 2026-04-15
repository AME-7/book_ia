import 'package:book_ia/features/auth/data/models/register_parames.dart';
import 'package:book_ia/features/auth/domain/usecases/forget_password_usecases.dart';
import 'package:book_ia/features/auth/domain/usecases/login_usecases.dart';
import 'package:book_ia/features/auth/domain/usecases/new_password_usecases.dart';
import 'package:book_ia/features/auth/domain/usecases/register_usecuses.dart';
import 'package:book_ia/features/auth/domain/usecases/verif_otp_usecases.dart';
import 'package:book_ia/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.loginUseCase,
    required this.registerUsecuses,
    required this.forgetPasswordUsecases,
    required this.verifOtpUsecases,
    required this.newPasswordUsecases,
  }) : super(AuthInitailState());
  final LoginUsecases loginUseCase;
  final RegisterUsecuses registerUsecuses;
  final ForgetPasswordUsecases forgetPasswordUsecases;
  final VerifOtpUsecases verifOtpUsecases;
  final NewPasswordUsecases newPasswordUsecases;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  String otp = '';
  void setOtp(String value) {
    otp = value;
  }

  Future<void> login() async {
    emit(AuthLodingState());
    var response = await loginUseCase.call(
      AuthParams(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    response.fold(
      (l) {
        emit(AuthErrorState(message: l.message));
      },
      (r) {
        emit(AuthSuccessState());
      },
    );
  }

  Future<void> register() async {
    emit(AuthLodingState());
    var response = await registerUsecuses.call(
      AuthParams(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
      ),
    );
    response.fold(
      (l) {
        emit(AuthErrorState(message: l.message));
      },
      (r) {
        emit(AuthSuccessState());
      },
    );
  }

  Future<void> forgot() async {
    emit(AuthLodingState());
    var response = await forgetPasswordUsecases.call(
      AuthParams(email: emailController.text),
    );
    response.fold(
      (l) {
        emit(AuthErrorState(message: l.message));
      },
      (r) {
        emit(AuthSuccessState());
      },
    );
  }

  Future<void> verifyOtp() async {
    emit(AuthLodingState());

    var response = await verifOtpUsecases.call(emailController.text, otp);

    response.fold(
      (l) {
        emit(AuthErrorState(message: l.message));
      },
      (r) {
        emit(AuthSuccessState());
      },
    );
  }

  Future<void> newPassword() async {
    emit(AuthLodingState());
    var response = await newPasswordUsecases.call(
      AuthParams(
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
      ),
    );
    response.fold(
      (l) {
        emit(AuthErrorState(message: l.message));
      },
      (r) {
        emit(AuthSuccessState());
      },
    );
  }
}
