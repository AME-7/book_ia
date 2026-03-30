import 'package:book_ia/features/home/data/models/best_seller_book_response/product.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeloadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<Product> books;

  HomeSuccessState(this.books);
}

class HomeErrorState extends HomeState {}
