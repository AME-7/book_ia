import 'dart:developer';

import 'package:book_ia/core/services/dio/apis.dart';
import 'package:book_ia/core/services/dio_provider.dart';
import 'package:book_ia/features/auth/data/models/auth_responnse/register_responnse.dart';
import 'package:book_ia/features/auth/data/models/register_parames.dart';

class AuthRepo {
  static Future<AuthResponnse?> register(RegisterParames params) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.register,
        data: params.toJson(),
      );
      if (response.statusCode == 201) {
        response.data;
        var data = AuthResponnse.fromJson(response.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponnse?> login(RegisterParames params) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.login,
        data: params.toJson(),
      );
      if (response.statusCode == 200) {
        response.data;
        var data = AuthResponnse.fromJson(response.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponnse?> forgot(String email) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.forgotPassword,
        data: {'email': email},
      );
      if (response.statusCode == 200) {
        var data = AuthResponnse.fromJson(response.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponnse?> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.checkForgetPassword,
        data: {"email": email, "verify_code": otp},
      );

      if (response.statusCode == 200) {
        var data = AuthResponnse.fromJson(response.data);
        return data;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
