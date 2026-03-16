import 'dart:io';

import 'package:book_ia/core/routes/app_router.dart';
import 'package:book_ia/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.routes,
      debugShowCheckedModeBanner: false,
      builder: (_, child) =>
          SafeArea(top: false, bottom: Platform.isAndroid, child: child!),
      theme: AppThemes.lightTheme,
    );
  }
}
