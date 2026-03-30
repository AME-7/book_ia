import 'package:book_ia/features/home/data/models/best_seller_book_response/product.dart';

abstract class WishlistState {}

class WishlistInitialState extends WishlistState {}

class WishlistLoadingState extends WishlistState {}

class WishlistSuccessState extends WishlistState {
  final List<Product> products;

  WishlistSuccessState(this.products);
}

class WishlistErrorState extends WishlistState {}
