import 'package:book_ia/core/services/dio/failure.dart';
import 'package:book_ia/features/home/data/models/best_seller_book_response/data.dart';
import 'package:book_ia/features/home/data/models/best_seller_book_response/product.dart';
import 'package:book_ia/features/home/data/models/slider_response/data.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, SliderResponse>> getSliders();
  Future<Either<Failure, BestSellerBooksResponse>> getBestSellers();
  Future<Either<Failure, List<Product>>> searchBooks(String query);
}
