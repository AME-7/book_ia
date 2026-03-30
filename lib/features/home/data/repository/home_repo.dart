import 'package:book_ia/core/services/dio/apis.dart';
import 'package:book_ia/core/services/dio/dio_provider.dart';
import 'package:book_ia/features/home/data/models/best_seller_book_response/best_seller_book_response.dart';
import 'package:book_ia/features/home/data/models/best_seller_book_response/product.dart';
import 'package:book_ia/features/home/data/models/slider_response/slider_response.dart';

class HomeRepo {
  Future<SliderResponse> getSliders() async {
    final response = await DioProvider.get(endpoint: Apis.sliders);
    return SliderResponse.fromJson(response.data);
  }

  Future<List<Product>> getBestSellersBooks() async {
    final response = await DioProvider.get(endpoint: Apis.productsBestseller);

    final data = ProductsResponse.fromJson(response.data);
    return data.data?.products ?? [];
  }

  Future<List<Product>> searchBooks(String query) async {
    final response = await DioProvider.get(
      endpoint: Apis.search,
      queryParameters: {'name': query},
    );

    final data = ProductsResponse.fromJson(response.data);
    return data.data?.products ?? [];
  }
}
