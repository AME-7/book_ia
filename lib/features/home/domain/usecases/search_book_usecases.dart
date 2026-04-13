import 'package:book_ia/core/services/dio/failure.dart';
import 'package:book_ia/features/home/data/models/best_seller_book_response/product.dart';
import 'package:book_ia/features/home/domain/repository/home_repo.dart';
import 'package:dartz/dartz.dart';

class SearchBookUsecases {
  final HomeRepository homeRepository;

  SearchBookUsecases(this.homeRepository);
  Future<Either<Failure, List<Product>>> call(String query) {
    return homeRepository.searchBooks(query);
  }
}
