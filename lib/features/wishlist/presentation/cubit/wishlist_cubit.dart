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
      SharedPref.cacheWishlistIds(products);
      emit(WishlistSuccessState(List.from(products)));
    } else {
      emit(WishlistErrorState());
    }
  }

  Future<void> addToWishlist(Product product) async {
    // optimistic update
    products.add(product);
    emit(WishlistSuccessState(List.from(products)));

    SharedPref.cacheWishlistIds(products);

    var data = await WishlistRepo.addToWishlist(product.id ?? 0);

    if (data == null) {
      products.removeWhere((p) => p.id == product.id);
      emit(WishlistErrorState());
    }
  }

  Future<void> removeFromWishlist(int productId) async {
    products.removeWhere((p) => p.id == productId);

    SharedPref.cacheWishlistIds(products);

    emit(WishlistSuccessState(List.from(products)));

    var data = await WishlistRepo.removeFromWishlist(productId);

    if (data == null) {
      emit(WishlistErrorState());
    }
  }

  void toggleWishlist(Product product) {
    if (isInWishlist(product.id ?? 0)) {
      removeFromWishlist(product.id ?? 0);
    } else {
      addToWishlist(product);
    }
  }

  bool isInWishlist(int productId) {
    return products.any((p) => p.id == productId);
  }
}
