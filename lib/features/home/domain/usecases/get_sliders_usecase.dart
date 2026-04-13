import 'package:book_ia/core/services/dio/failure.dart';
import 'package:book_ia/features/home/data/models/slider_response/data.dart';
import 'package:book_ia/features/home/domain/repository/home_repo.dart';
import 'package:dartz/dartz.dart';

class GetSlidersUseCase {
  final HomeRepository homeRepository;

  GetSlidersUseCase(this.homeRepository);

  Future<Either<Failure, SliderResponse>> call() {
    return homeRepository.getSliders();
  }
}
