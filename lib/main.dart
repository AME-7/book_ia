import 'package:book_ia/core/services/dio/dio_provider.dart';
import 'package:book_ia/core/services/local/shared_pref.dart';
import 'package:book_ia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:book_ia/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:book_ia/root.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  DioProvider.init();
  await SharedPref.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistCubit()..getWishlist()),
        BlocProvider(create: (_) => CartCubit()),
        BlocProvider(create: (context) => CartCubit()..getCart()),
      ],

      child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        child: const MainApp(),
      ),
    ),
  );
}
