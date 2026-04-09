import 'dart:developer';
import 'package:book_ia/core/services/dio/apis.dart';
import 'package:book_ia/core/services/dio/dio_provider.dart';
import 'package:book_ia/core/services/dio/failure.dart';
import 'package:book_ia/core/services/local/shared_pref.dart';
import 'package:book_ia/features/auth/data/models/auth_response/auth_response.dart';
import 'package:book_ia/features/auth/data/models/register_parames.dart';
import 'package:dartz/dartz.dart';

class AuthRepo {
  static Future<Either<Failure, AuthResponse>> register(
    RegisterParames params,
  ) async {
    var response = await DioProvider.postApi(
      endpoint: Apis.register,
      data: params.toJson(),
    );
    return response.fold(
      (l) {
        return Left(l);
      },
      (right) {
        var data = AuthResponse.fromJson(right);
        SharedPref.setToken(data.token ?? '');
        SharedPref.setUserInfo(data.user);
        return Right(data);
      },
    );
  }

  static Future<Either<Failure, AuthResponse>> login(
    RegisterParames params,
  ) async {
    var response = await DioProvider.postApi(
      endpoint: Apis.login,
      data: params.toJson(),
    );
    return response.fold(
      (l) {
        return Left(l);
      },
      (right) {
        var data = AuthResponse.fromJson(right);
        SharedPref.setToken(data.token ?? '');
        SharedPref.setUserInfo(data.user);
        return Right(data);
      },
    );
  }

  static Future<AuthResponse?> forgot(String email) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.forgotPassword,
        data: {'email': email},
      );
      if (response.statusCode == 200) {
        var data = AuthResponse.fromJson(response.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.checkForgetPassword,
        data: {"email": email, "verify_code": otp},
      );

      if (response.statusCode == 200) {
        var data = AuthResponse.fromJson(response.data);
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
