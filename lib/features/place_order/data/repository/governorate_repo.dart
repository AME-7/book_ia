import 'dart:developer';

import 'package:book_ia/core/services/dio/apis.dart';
import 'package:book_ia/core/services/dio/dio_provider.dart';
import 'package:book_ia/features/place_order/data/models/governorate_response.dart';

class PlaceOrderRepo {
  static Future<GovernoratesResponse?> getGovernorates() async {
    try {
      var response = await DioProvider.get(endpoint: Apis.governorates);
      if (response.statusCode == 200) {
        return GovernoratesResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
