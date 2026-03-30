import 'package:book_ia/core/services/local/shared_pref.dart';
import 'package:book_ia/features/cart/data/repository/cart_repo.dart';
import 'package:book_ia/features/detalis/presentation/widgets/cart_action/cubit/cart_action_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartActionCubit extends Cubit<CartActionState> {
  CartActionCubit() : super(CartActionsInitial());

  Future<void> addToCart(int productId) async {
    emit(CartActionsLoadingState());
    var data = await CartRepo.addToCart(productId);
    if (data != null) {
      var products = data.data?.cartItems ?? [];
      SharedPref.cacheCartIds(products);
      emit(CartActionsSuccessState(msg: 'Added To Cart'));
    } else {
      emit(CartActionsErrorState());
    }
  }

  Future<void> removFromCart(int productId) async {
    emit(CartActionsLoadingState());
    var data = await CartRepo.removeFromCart(productId);
    if (data != null) {
      var products = data.data?.cartItems ?? [];
      SharedPref.cacheCartIds(products);
      emit(CartActionsSuccessState(msg: 'Removed From Cart'));
    } else {
      emit(CartActionsErrorState());
    }
  }

  bool isProductInCart(int productId) {
    var cartIds = SharedPref.getCartIds();
    return cartIds.contains(productId);
  }
}
