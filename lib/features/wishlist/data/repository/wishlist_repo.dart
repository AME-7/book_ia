import 'package:book_ia/core/services/dio/apis.dart';
import 'package:book_ia/core/services/dio/dio_provider.dart';
import 'package:book_ia/core/services/local/shared_pref.dart';
import 'package:book_ia/features/wishlist/data/model/wishlist_response/wishlist_response.dart';

class WishlistRepo {
  static Future<WishlistResponse?> getWishlist() async {
    try {
      var response = await DioProvider.get(
        endpoint: Apis.wishlist,
        queryParameters: {"page": 1},
        headers: {
          "Authorization": "Bearer ${SharedPref.getToken(SharedPref.kToken)}",
        },
      );
      if (response.statusCode == 200) {
        return WishlistResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<WishlistResponse?> addToWishlist(int productId) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.addTowishlist,
        queryParameters: {"page": 1},
        data: {"product_id": productId},
        headers: {
          "Authorization": "Bearer ${SharedPref.getToken(SharedPref.kToken)}",
        },
      );
      if (response.statusCode == 200) {
        return WishlistResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<WishlistResponse?> removeFromWishlist(int productId) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.removeFromwishlist,
        queryParameters: {"page": 1},
        data: {"product_id": productId},
        headers: {
          "Authorization": "Bearer ${SharedPref.getToken(SharedPref.kToken)}",
        },
      );
      if (response.statusCode == 200) {
        return WishlistResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
