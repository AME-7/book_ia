import 'package:book_ia/core/services/dio/failure.dart';
import 'package:book_ia/features/auth/data/models/auth_response/auth_response.dart';
import 'package:book_ia/features/auth/data/models/register_parames.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, AuthResponse>> register(AuthParams params);
  Future<Either<Failure, AuthResponse>> login(AuthParams params);
  Future<Either<Failure, AuthResponse>> forgetPassword(String email);
  Future<Either<Failure, AuthResponse>> verifyOtp(String email, String otp);
  Future<Either<Failure, AuthResponse>> newPassword(AuthParams params);
}
