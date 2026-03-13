import 'package:book_ia/core/styles/colors.dart';
import 'package:book_ia/core/styles/text_style.dart';
import 'package:book_ia/core/widget/main_button.dart';
import 'package:book_ia/features/home/data/models/best_seller_book_response/product.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.secondaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10),
              child: Image.network(
                product.image ?? '',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Gap(10),
          Text(product.name ?? '', maxLines: 2, style: AppTextStyle.body),
          Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 45,
                child: Text(
                  '\$${product.priceAfterDiscount}',
                  style: AppTextStyle.body,
                ),
              ),
              SizedBox(
                height: 30,
                child: MainButton(
                  minWigth: 70,
                  minHeight: 30,

                  text: 'Bay',
                  onPressed: () {},
                  bgColor: AppColors.blackColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
