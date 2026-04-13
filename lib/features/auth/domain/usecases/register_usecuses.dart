import 'package:book_ia/core/services/dio/failure.dart';
import 'package:book_ia/features/auth/data/models/auth_response/auth_response.dart';
import 'package:book_ia/features/auth/data/models/register_parames.dart';
import 'package:book_ia/features/auth/domain/repository/auth_repo.dart';
import 'package:dartz/dartz.dart';

class RegisterUsecuses {
  final AuthRepository authRepository;

  RegisterUsecuses(this.authRepository);
  Future<Either<Failure, AuthResponse>> call(AuthParams params) {
    return authRepository.register(params);
  }
}
