import 'package:book_ia/features/orders/order_history/data/models/order_model.dart';
import 'package:book_ia/features/orders/order_history/data/repository/order_repo.dart';
import 'package:book_ia/features/orders/order_history/presentation/cubit/order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());

  List<OrderModel> orders = [];

  Future<void> getOrders() async {
    emit(OrdersLoading());

    try {
      orders = await OrdersRepo.getOrders();
      emit(OrdersSuccess());
    } catch (e) {
      emit(OrdersError());
    }
  }
}
