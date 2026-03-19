import 'package:book_ia/core/services/local/shared_pref.dart';
import 'package:book_ia/features/home/data/models/best_seller_book_response/product.dart';
import 'package:book_ia/features/wishlist/data/repository/wishlist_repo.dart';
import 'package:book_ia/features/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitialState());

  List<Product> products = [];

  Future<void> getWishlist() async {
    emit(WishlistLoadingState());
    var data = await WishlistRepo.getWishlist();
    if (data != null) {
      products = data.data?.products ?? [];
      SharedPref.cacheWishlistids(products);
      emit(WishlistSuccessState());
    } else {
      emit(WishlistErrorState());
    }
  }

  Future<void> removeFromWishlist(int productId) async {
    emit(WishlistLoadingState());
    var data = await WishlistRepo.removeFromWishlist(productId);
    if (data != null) {
      products = data.data?.products ?? [];
      SharedPref.cacheWishlistids(products);
      emit(WishlistSuccessState());
    } else {
      emit(WishlistErrorState());
    }
  }
}
