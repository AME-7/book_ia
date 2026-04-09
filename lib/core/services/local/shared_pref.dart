import 'dart:convert';
import 'package:book_ia/features/auth/data/models/auth_response/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:book_ia/features/cart/data/model/cart_response/cart_item.dart';
import 'package:book_ia/features/home/data/models/best_seller_book_response/product.dart';

abstract class SharedPref {
  static late SharedPreferences _pref;

  static const String kToken = 'token';
  static const String kUser = 'user';
  static const String kWishlist = 'wishlistIds';
  static const String kCart = 'cartIds';

  ///  init
  static Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  // ================= TOKEN =================

  static Future<void> setToken(String value) async {
    await _pref.setString(kToken, value);
  }

  static String? getToken() {
    return _pref.getString(kToken);
  }

  static Future<void> removeToken() async {
    await _pref.remove(kToken);
  }

  // ================= USER =================

  static Future<void> setUserInfo(User? model) async {
    if (model == null) return;

    final jsonString = jsonEncode(model.toJson());
    await _pref.setString(kUser, jsonString);
  }

  static User? getUserInfo() {
    final cachedString = _pref.getString(kUser);

    if (cachedString == null) return null;

    final jsonData = jsonDecode(cachedString);
    return User.fromJson(jsonData);
  }

  static Future<void> removeUser() async {
    await _pref.remove(kUser);
  }

  // ================= WISHLIST =================

  static Future<void> cacheWishlistIds(List<Product> items) async {
    final ids = items.map((e) => e.id.toString()).toList();
    await _pref.setStringList(kWishlist, ids);
  }

  static List<int> getWishlistIds() {
    final ids = _pref.getStringList(kWishlist);
    if (ids == null) return [];

    return ids.map((e) => int.tryParse(e) ?? 0).toList();
  }

  // ================= CART =================

  static Future<void> cacheCartIds(List<CartItem> items) async {
    final ids = items.map((e) => e.itemProductId.toString()).toList();
    await _pref.setStringList(kCart, ids);
  }

  static List<int> getCartIds() {
    final ids = _pref.getStringList(kCart);
    if (ids == null) return [];

    return ids.map((e) => int.tryParse(e) ?? 0).toList();
  }

  // ================= GENERAL =================

  static Future<void> clearAll() async {
    await _pref.clear();
  }
}
