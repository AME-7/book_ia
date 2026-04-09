import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:book_ia/features/home/data/models/best_seller_book_response/product.dart';

class OrderCache {
  static const String key = "orders";

  /// ✅ حفظ أوردر جديد
  static Future<void> saveOrder(List<Product> products) async {
    final prefs = await SharedPreferences.getInstance();

    print("SAVING ITEMS: ${products.length}");

    /// 🟢 هات كل الأوردرات القديمة
    List<String> existingOrders = prefs.getStringList(key) ?? [];

    /// 🟢 حول الأوردر الحالي لـ JSON
    List<Map<String, dynamic>> order = products.map((e) => e.toJson()).toList();

    /// 🟢 ضيفه على اللي قبله
    existingOrders.add(jsonEncode(order));

    /// 🟢 خزّن كله
    await prefs.setStringList(key, existingOrders);
  }

  /// ✅ رجّع كل الأوردرات
  static Future<List<List<Product>>> getOrders() async {
    final prefs = await SharedPreferences.getInstance();

    List<String> savedOrders = prefs.getStringList(key) ?? [];

    List<List<Product>> orders = savedOrders.map((orderString) {
      List decoded = jsonDecode(orderString);
      return decoded.map((e) => Product.fromJson(e)).toList();
    }).toList();

    print("LOADED ORDERS: ${orders.length}");

    return orders;
  }

  /// 🧹 مسح كل الأوردرات (اختياري)
  static Future<void> clearOrders() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
