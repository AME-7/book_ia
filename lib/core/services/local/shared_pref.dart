import 'dart:convert';
import 'dart:core';

import 'package:book_ia/features/auth/data/models/auth_responnse/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPref {
  static late SharedPreferences pref;
  static const String ktoken = 'token';
  static const String kUser = 'user';

  static Future<void> init() async {
    pref = await SharedPreferences.getInstance();
  }

  static Future<void> setToken(String value) async {
    await pref.setString(ktoken, value);
  }

  static String? getToken() {
    return pref.getString(ktoken);
  }

  static Future<void> setUser(User? model) async {
    if (model == null) {
      return;
    }
    var objToJson = model.toJson();
    var jsonToString = jsonEncode(objToJson.toString());
    await pref.setString(kUser, jsonToString);
  }

  static User? getUser() {
    var cachString = pref.getString(kUser);
    if (cachString == null) {
      return null;
    }
    var stringToJson = jsonDecode(cachString);

    var jsonToObject = User.fromJson(stringToJson);
    return jsonToObject;
  }

  static Future<void> cechData(String key, dynamic value) async {
    if (value is String) {
      await pref.setString(key, value);
    } else if (value is int) {
      await pref.setInt(key, value);
    } else if (value is bool) {
      await pref.setBool(key, value);
    } else if (value is double) {
      await pref.setDouble(key, value);
    } else if (value is List<String>) {
      await pref.setStringList(key, value);
    }
  }

  static Object getString(String kay) {
    return pref.get(kay) ?? '';
  }

  static Future<void> removeData(String kay) async {
    await pref.remove(kay);
  }

  static Future<void> clear() async {
    await pref.clear();
  }
}
