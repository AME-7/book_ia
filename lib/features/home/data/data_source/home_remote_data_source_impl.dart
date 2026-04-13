import 'package:book_ia/core/services/dio/apis.dart';
import 'package:book_ia/core/services/dio/dio_provider.dart';
import 'package:book_ia/core/services/dio/failure.dart';
import 'package:book_ia/features/home/data/data_source/home_remote_data_source.dart';
import 'package:book_ia/features/home/data/models/best_seller_book_response/data.dart';
import 'package:book_ia/features/home/data/models/slider_response/data.dart';
import 'package:dartz/dartz.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<Either<Failure, SliderResponse>> getSliders() async {
    var response = await DioProvider.getApi(endpoint: Apis.sliders);

    return response.fold((l) => Left(l), (right) {
      return Right(SliderResponse.fromJson(right));
    });
  }

  @override
  Future<Either<Failure, BestSellerBooksResponse>> getBestSellers() async {
    var response = await DioProvider.getApi(endpoint: Apis.productsBestseller);

    return response.fold((l) => Left(l), (right) {
      return Right(BestSellerBooksResponse.fromJson(right));
    });
  }
}
