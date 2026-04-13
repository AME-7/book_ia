import 'package:book_ia/core/services/dio/failure.dart';
import 'package:book_ia/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:book_ia/features/auth/data/models/auth_response/auth_response.dart';
import 'package:book_ia/features/auth/data/models/register_parames.dart';
import 'package:book_ia/features/auth/domain/repository/auth_repo.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl(this.authRemoteDataSource);
  @override
  Future<Either<Failure, AuthResponse>> login(AuthParams params) {
    return authRemoteDataSource.login(params);
  }

  @override
  Future<Either<Failure, AuthResponse>> register(AuthParams params) {
    return authRemoteDataSource.register(params);
  }

  @override
  Future<Either<Failure, AuthResponse>> forgetPassword(String email) {
    return authRemoteDataSource.forgetPassword(email);
  }

  @override
  Future<Either<Failure, AuthResponse>> verifyOtp(String email, String otp) {
    return authRemoteDataSource.verifyOtp(email, otp);
  }

  @override
  Future<Either<Failure, AuthResponse>> newPassword(AuthParams params) {
    return authRemoteDataSource.newPassword(params);
  }
}
