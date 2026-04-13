import 'product.dart';

class BestSellerBooksResponse {
  List<Product>? products;

  BestSellerBooksResponse({this.products});

  factory BestSellerBooksResponse.fromJson(Map<String, dynamic> json) =>
      BestSellerBooksResponse(
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
    'products': products?.map((e) => e.toJson()).toList(),
  };
}
