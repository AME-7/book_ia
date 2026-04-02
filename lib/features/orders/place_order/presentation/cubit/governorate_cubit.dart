import 'package:book_ia/core/services/dio/apis.dart';
import 'package:book_ia/core/services/dio/dio_provider.dart';
import 'package:book_ia/core/services/local/shared_pref.dart';
import 'package:book_ia/features/orders/place_order/data/models/governorate.dart';
import 'package:book_ia/features/orders/place_order/data/repository/governorate_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'governorate_state.dart';

class PlaceOrderCubit extends Cubit<PlaceOrderState> {
  PlaceOrderCubit() : super(PlaceOrderInitial());

  List<Governorate> governorates = [];

  Future<void> getGovernorates() async {
    emit(GovernoratesLoadingState());
    var data = await PlaceOrderRepo.getGovernorates();
    if (data != null && data.data != null) {
      governorates = data.data ?? [];
      emit(GovernoratesSuccessState());
    } else {
      emit(GovernoratesErrorState());
    }
  }

  Future<void> placeOrder({
    required String name,
    required String email,
    required String address,
    required String phone,
    required int governorateId,
  }) async {
    emit(PlaceOrderLoadingState());

    try {
      var response = await DioProvider.post(
        endpoint: Apis.placeOrder,
        data: {
          "name": name,
          "email": email,
          "address": address,
          "phone": phone,
          "governorate_id": governorateId,
        },
        headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      );

      print(response.data);

      if (response.statusCode == 201) {
        final orderId = response.data['data']['id'];
        emit(PlaceOrderSuccessState(orderId: orderId));
      } else {
        emit(PlaceOrderErrorState());
      }
    } catch (e) {
      print(e.toString());
      emit(PlaceOrderErrorState());
    }
  }
}
