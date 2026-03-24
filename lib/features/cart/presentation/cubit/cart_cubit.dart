import 'package:book_ia/core/services/local/shared_pref.dart';
import 'package:book_ia/features/cart/data/model/cart_response/cart_item.dart';
import 'package:book_ia/features/cart/data/repository/cart_repo.dart';
import 'package:book_ia/features/cart/presentation/cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitialState());

  List<CartItem> products = [];
  String total = '';

  Future<void> getCart() async {
    emit(CartLoadingState());
    var data = await CartRepo.getCart();
    if (data != null) {
      products = data.data?.cartItems ?? [];
      total = data.data?.total ?? '';
      SharedPref.cacheCartids(products);
      emit(CartSuccessState());
    } else {
      emit(CartErrorState());
    }
  }

  Future<void> removeFromCart(int cartItemId) async {
    emit(CartLoadingState());
    var data = await CartRepo.removeFromCart(cartItemId);
    if (data != null) {
      products = data.data?.cartItems ?? [];
      total = data.data?.total ?? '';
      SharedPref.cacheCartids(products);
      emit(CartSuccessState());
    } else {
      emit(CartErrorState());
    }
  }

  Future<void> updateCart(int cartItemId, int quantity) async {
    emit(CartLoadingState());
    var data = await CartRepo.updateCart(cartItemId, quantity);
    if (data != null) {
      products = data.data?.cartItems ?? [];
      total = data.data?.total ?? '';
      SharedPref.cacheCartids(products);
      emit(CartSuccessState());
    } else {
      emit(CartErrorState());
    }
  }

  Future<void> checkout() async {
    emit(CheckoutLoadingState());
    var success = await CartRepo.checkout();
    if (success) {
      emit(CheckoutSuccessState());
    } else {
      emit(CheckoutErrorState());
    }
  }
}
