import 'package:book_ia/features/profile/presentation/update_password/cubit/update_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_ia/core/services/dio/apis.dart';
import 'package:book_ia/core/services/dio/dio_provider.dart';
import 'package:book_ia/core/services/local/shared_pref.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  UpdatePasswordCubit() : super(UpdatePasswordInitial());

  Future<void> updatePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    emit(UpdatePasswordLoading());

    try {
      final token = SharedPref.getToken(SharedPref.kToken);

      await DioProvider.post(
        endpoint: Apis.updatePassword,
        headers: {"Authorization": "Bearer $token"},
        data: {
          "current_password": oldPassword,
          "new_password": newPassword,
          "new_password_confirmation": confirmPassword,
        },
      );

      emit(UpdatePasswordSuccess());
    } catch (e) {
      emit(UpdatePasswordError('Wrong old password'));
    }
  }
}
