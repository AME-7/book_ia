import 'package:book_ia/core/services/dio/apis.dart';
import 'package:book_ia/core/services/dio/dio_provider.dart';
import 'package:book_ia/core/services/dio/failure.dart';
import 'package:book_ia/core/services/local/shared_pref.dart';
import 'package:book_ia/features/auth/data/models/auth_response/auth_response.dart';
import 'package:book_ia/features/auth/data/models/register_parames.dart';
import 'package:book_ia/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:dartz/dartz.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<Either<Failure, AuthResponse>> register(AuthParams params) async {
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

  @override
  Future<Either<Failure, AuthResponse>> login(AuthParams params) async {
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

  @override
  Future<Either<Failure, AuthResponse>> forgetPassword(String email) async {
    var response = await DioProvider.postApi(
      endpoint: Apis.forgotPassword,
      data: email,
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

  @override
  Future<Either<Failure, AuthResponse>> verifyOtp(
    String email,
    String otp,
  ) async {
    var response = await DioProvider.postApi(
      endpoint: Apis.checkForgetPassword,
      data: {"email": email, "otp": otp},
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

  @override
  Future<Either<Failure, AuthResponse>> newPassword(AuthParams params) async {
    var response = await DioProvider.postApi(
      endpoint: Apis.newPassword,
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
}
