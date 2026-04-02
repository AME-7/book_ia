import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:book_ia/features/home/data/models/best_seller_book_response/product.dart';

class OrderCache {
  static const String lastOrderKey = "last_order";

  static Future<void> saveOrder(List<Product> items) async {
    final prefs = await SharedPreferences.getInstance();

    print("SAVING ITEMS: ${items.length}");

    await prefs.setString(
      lastOrderKey,
      jsonEncode(items.map((e) => e.toJson()).toList()),
    );
  }

  static Future<List<Product>> getOrder() async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getString(lastOrderKey);

    if (data == null || data.isEmpty) {
      print("NO SAVED ORDER ❌");
      return [];
    }

    final list = jsonDecode(data);

    print("LOADED FROM CACHE: ${list.length}");

    return (list as List)
        .map((e) => Product.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  void cleareCeart() {}
}
