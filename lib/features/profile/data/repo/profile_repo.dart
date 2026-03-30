import 'dart:developer';

import 'package:book_ia/core/services/dio/apis.dart';
import 'package:book_ia/core/services/dio/dio_provider.dart';
import 'package:book_ia/core/services/local/shared_pref.dart';
import 'package:book_ia/features/profile/data/model/update_profile_params.dart';
import 'package:book_ia/features/profile/data/model/update_profile_response/update_profile_response.dart';

class ProfileRepo {
  static Future<UpdateProfileResponse?> editProfile(
    UpdateProfileParams params,
  ) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.updateProfile,
        data: params.toFormData(),
        headers: {
          'Content-Type': 'multipart/form-data',
          "authorization": "Bearer${SharedPref.getToken}",
        },
      );
      if (response.statusCode == 200) {
        var data = UpdateProfileResponse.fromJson(response.data);
        SharedPref.setUserInfo(data.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
