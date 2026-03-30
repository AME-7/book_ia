import 'package:book_ia/features/home/data/models/best_seller_book_response/product.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<Product> books;
  SearchSuccess(this.books);
}

class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}
