import 'package:book_ia/core/services/dio/dio_provider.dart';
import 'package:book_ia/core/services/local/shared_pref.dart';
import 'package:book_ia/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:book_ia/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioProvider.int();
  await SharedPref.init();

  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => WishlistCubit()..getWishlist())],
      child: const MainApp(),
    ),
  );
}
