import 'package:book_ia/core/services/dio/failure.dart';
import 'package:book_ia/features/home/data/models/best_seller_book_response/data.dart';
import 'package:book_ia/features/home/domain/repository/home_repo.dart';
import 'package:dartz/dartz.dart';

class GetBestSellersUseCase {
  final HomeRepository homeRepository;

  GetBestSellersUseCase(this.homeRepository);

  Future<Either<Failure, BestSellerBooksResponse>> call() {
    return homeRepository.getBestSellers();
  }
}
