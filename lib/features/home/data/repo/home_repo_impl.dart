import 'package:book_ia/core/services/dio/failure.dart';
import 'package:book_ia/features/home/data/data_source/home_remote_data_source.dart';
import 'package:book_ia/features/home/data/models/best_seller_book_response/data.dart';
import 'package:book_ia/features/home/data/models/slider_response/data.dart';
import 'package:book_ia/features/home/domain/repository/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl(this.homeRemoteDataSource);

  @override
  Future<Either<Failure, SliderResponse>> getSliders() {
    return homeRemoteDataSource.getSliders();
  }

  @override
  Future<Either<Failure, BestSellerBooksResponse>> getBestSellers() {
    return homeRemoteDataSource.getBestSellers();
  }
}
