import 'package:book_ia/core/constants/app_images.dart';
import 'package:book_ia/core/functions/navigations.dart';
import 'package:book_ia/core/routes/routes.dart';
import 'package:book_ia/core/services/local/shared_pref.dart';
import 'package:book_ia/core/styles/text_style.dart';
import 'package:book_ia/core/widget/custom_svg_picture.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    String? token = SharedPref.getToken(SharedPref.kToken);
    Future.delayed(const Duration(seconds: 3), () {
      if (token != null && token.isNotEmpty) {
        pushReplacment(context, Routes.main);
      } else {
        pushReplacment(context, Routes.welcome);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSvgPicture(path: AppImages.logoSvg, width: 250),
            Gap(10),
            Text('Order Your Book Now ', style: AppTextStyle.subtitle2),
          ],
        ),
      ),
    );
  }
}
