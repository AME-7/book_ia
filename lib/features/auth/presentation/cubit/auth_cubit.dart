import 'package:book_ia/features/auth/data/models/register_parames.dart';
import 'package:book_ia/features/auth/data/repo/auth_repo.dart';
import 'package:book_ia/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitailState());
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
    var response = await AuthRepo.login(
      RegisterParames(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    if (response != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(message: "Failed to Login"));
    }
  }

  Future<void> register() async {
    emit(AuthLodingState());
    var response = await AuthRepo.register(
      RegisterParames(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
      ),
    );
    if (response != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(message: "Failed to register"));
    }
  }

  Future<void> forgot() async {
    emit(AuthLodingState());
    var response = await AuthRepo.forgot(emailController.text);
    if (response != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(message: "Failed to send code"));
    }
  }

  Future<void> verifyOtp() async {
    emit(AuthLodingState());

    var response = await AuthRepo.verifyOtp(otp);

    if (response != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(message: "Invalid Code"));
    }
  }
}
