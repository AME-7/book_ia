import 'package:book_ia/core/constants/app_fonts.dart';
import 'package:book_ia/core/styles/colors.dart';
import 'package:book_ia/core/styles/text_style.dart';
import 'package:flutter/material.dart';

abstract class AppThemes {
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: AppFonts.dMserif,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
      ),
      dividerColor: Colors.transparent,
      dividerTheme: DividerThemeData(color: AppColors.darkgreyColor),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: AppTextStyle.body.copyWith(color: AppColors.greyColor),
        fillColor: AppColors.accentColor,
        filled: true,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.accentColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.accentColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.errorColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.errorColor),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.greyColor,
        backgroundColor: Colors.transparent,
        selectedLabelStyle: AppTextStyle.caption2.copyWith(
          fontWeight: FontWeight.w600,
          height: 2,
        ),
        unselectedLabelStyle: AppTextStyle.caption2.copyWith(
          fontWeight: FontWeight.w600,
          height: 2,
        ),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        onSurface: AppColors.blackColor,
      ),
    );
  }
}
