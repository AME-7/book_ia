import 'package:book_ia/core/functions/navigations.dart';
import 'package:book_ia/core/routes/routes.dart';
import 'package:book_ia/core/styles/colors.dart';
import 'package:book_ia/core/styles/text_style.dart';
import 'package:book_ia/core/widget/main_button.dart';
import 'package:book_ia/features/home/data/models/best_seller_book_response/product.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    required this.product,
    this.onRemoveFromWishlist,
    this.onRefresh,
  });
  final Product product;
  final Function()? onRemoveFromWishlist;
  final Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushTo(context, Routes.detalis, extra: product).then((value) {
          onRefresh?.call();
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.secondaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                tag: product.id ?? '',
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10),
                  child: Image.network(
                    product.image ?? '',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
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
                    '\$${product.priceAfterDiscount ?? product.price}',
                    style: AppTextStyle.body,
                  ),
                ),
                onRemoveFromWishlist != null
                    ? IconButton(
                        onPressed: onRemoveFromWishlist,
                        style: IconButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(30, 30),
                        ),
                        icon: Icon(Icons.delete, color: AppColors.errorColor),
                      )
                    : SizedBox(
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
      ),
    );
  }
}
