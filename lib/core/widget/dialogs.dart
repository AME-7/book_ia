import 'package:book_ia/core/constants/app_images.dart';
import 'package:book_ia/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum DialogType { success, error }

showMyDialog(
  BuildContext context,
  String errorMsg, {
  DialogType type = DialogType.error,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      backgroundColor: type == DialogType.error
          ? AppColors.errorColor
          : Colors.green,
      content: Row(
        children: [
          const Icon(Icons.error, color: AppColors.accentColor, size: 20),
          Text(errorMsg),
        ],
      ),
    ),
  );
}

showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: AppColors.darkgreyColor.withValues(alpha: .5),
    builder: (context) => Center(child: Lottie.asset(AppImages.lodingJson)),
  );
}
