import 'package:book_ia/core/services/dio/failure.dart';
import 'package:book_ia/features/auth/data/models/auth_response/auth_response.dart';
import 'package:book_ia/features/auth/domain/repository/auth_repo.dart';
import 'package:dartz/dartz.dart';

class VerifOtpUsecases {
  final AuthRepository authRepository;
  VerifOtpUsecases(this.authRepository);
  Future<Either<Failure, AuthResponse>> call() {
    return authRepository.verifyOtp("email", "otp");
  }
}
