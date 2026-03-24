import 'package:book_ia/features/place_order/data/models/governorate.dart';
import 'package:book_ia/features/place_order/data/repository/governorate_repo.dart';
import 'package:book_ia/features/place_order/presentation/cubit/governorate_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
}
