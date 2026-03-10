import 'package:book_ia/core/styles/text_style.dart';
import 'package:book_ia/features/home/presentation/widget/book_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BestSellerBooks extends StatelessWidget {
  const BestSellerBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Best Seller', style: AppTextStyle.title),
        Gap(30),
        GridView.builder(
          itemCount: 10,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 11,
            crossAxisSpacing: 11,
            childAspectRatio: .6,
          ),
          itemBuilder: (context, index) {
            return BookCard();
          },
        ),
      ],
    );
  }
}
