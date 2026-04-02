import 'package:book_ia/core/styles/text_style.dart';
import 'package:book_ia/core/widget/shimmer/grid_shimmer.dart';
import 'package:book_ia/core/widget/shimmer/text_shimmer.dart';
import 'package:book_ia/features/home/presentation/cubit/home_cubit.dart';
import 'package:book_ia/features/home/presentation/cubit/home_state.dart';
import 'package:book_ia/features/home/presentation/widget/book_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class BestSellerBooks extends StatelessWidget {
  const BestSellerBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccessState) {
          var books = state.books;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("best_seller".tr(), style: AppTextStyle.title),
              Gap(30),
              GridView.builder(
                itemCount: books.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 11,
                  crossAxisSpacing: 11,
                  childAspectRatio: .6,
                ),
                itemBuilder: (context, index) {
                  return BookCard(product: books[index]);
                },
              ),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextShimmer(width: 100),
              Gap(30),
              GridShimmer(
                crossAxisCount: 2,
                mainAxisSpacing: 11,
                crossAxisSpacing: 11,
                childAspectRatio: .6,
              ),
            ],
          );
        }
      },
    );
  }
}
