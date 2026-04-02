import 'package:book_ia/core/constants/app_images.dart';
import 'package:book_ia/core/functions/extension.dart';
import 'package:book_ia/core/functions/navigations.dart';
import 'package:book_ia/core/routes/routes.dart';
import 'package:book_ia/core/widget/custom_svg_picture.dart';
import 'package:book_ia/features/home/data/repository/home_repo.dart';
import 'package:book_ia/features/home/presentation/cubit/home_cubit.dart';
import 'package:book_ia/features/home/presentation/widget/best_seller_books.dart';
import 'package:book_ia/features/home/presentation/widget/home_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRepo())..initLoadData(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: CustomSvgPicture(path: AppImages.logoSvg, height: 30),
          actions: [
            IconButton(
              onPressed: () {
                pushTo(context, Routes.search);
              },
              icon: CustomSvgPicture(path: AppImages.searchSvg),
            ),
            IconButton(
              onPressed: () {
                bool isArabic = context.isArabic;
                context.setLocale(Locale(isArabic ? 'en' : 'ar'));
              },
              icon: Icon(Icons.language),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(20),
                HomeSlider(),
                Gap(30),
                BestSellerBooks(),
                Gap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
