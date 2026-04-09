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
    var response = await AuthRepo.register(
      RegisterParames(
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
    var response = await AuthRepo.forgot(
      RegisterParames(email: emailController.text),
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

    var response = await AuthRepo.verifyOtp(
      email: emailController.text,
      otp: otp,
    );

    if (response != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(message: "Invalid Code"));
    }
  }
}
