import 'package:book_ia/core/services/local/shared_pref.dart';
import 'package:book_ia/features/detalis/presentation/widgets/wishlist_action/cubit/wishlist_action_state.dart';
import 'package:book_ia/features/wishlist/data/repository/wishlist_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistActionCubit extends Cubit<WishlistActionState> {
  WishlistActionCubit() : super(WishlistActionInitial());

  Future<void> addToWishlist(int productId) async {
    emit(WishlistActionLoadingState());
    var data = await WishlistRepo.addToWishlist(productId);
    if (data != null) {
      var products = data.data?.products ?? [];
      SharedPref.cacheWishlistIds(products);
      emit(WishlistActionSuccessState(msg: 'Added To Wishlist'));
    } else {
      emit(WishlistActionErrorState());
    }
  }

  Future<void> removFromWishlist(int productId) async {
    emit(WishlistActionLoadingState());
    var data = await WishlistRepo.removeFromWishlist(productId);
    if (data != null) {
      var products = data.data?.products ?? [];
      SharedPref.cacheWishlistIds(products);
      emit(WishlistActionSuccessState(msg: 'Removed From Wishlist'));
    } else {
      emit(WishlistActionErrorState());
    }
  }

  bool isProductInWishlist(int productId) {
    var wishlistIds = SharedPref.getWishlistIds();
    return wishlistIds.contains(productId);
  }
}
