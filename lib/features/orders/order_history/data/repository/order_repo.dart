import 'package:book_ia/core/services/dio/apis.dart';
import 'package:book_ia/core/services/dio/dio_provider.dart';
import 'package:book_ia/core/services/local/shared_pref.dart';
import 'package:book_ia/features/orders/order_history/data/models/order_model.dart';

class OrdersRepo {
  static Future<List<OrderModel>> getOrders() async {
    try {
      var response = await DioProvider.get(
        endpoint: Apis.orderHistory,
        headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      );

      if (response.statusCode == 200) {
        List orders = response.data['data']['orders'];

        return orders.map((e) => OrderModel.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
