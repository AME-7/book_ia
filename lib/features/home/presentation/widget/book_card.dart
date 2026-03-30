import 'package:book_ia/core/functions/navigations.dart';
import 'package:book_ia/core/routes/routes.dart';
import 'package:book_ia/core/styles/colors.dart';
import 'package:book_ia/core/styles/text_style.dart';
import 'package:book_ia/core/widget/main_button.dart';
import 'package:book_ia/features/home/data/models/best_seller_book_response/product.dart';
import 'package:book_ia/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.product, this.onRemoveFromWishlist});

  final Product product;
  final Function()? onRemoveFromWishlist;

  @override
  Widget build(BuildContext context) {
    final wishlistCubit = context.watch<WishlistCubit>();
    final isFav = wishlistCubit.isInWishlist(product.id ?? 0);

    return GestureDetector(
      onTap: () {
        pushTo(context, Routes.detalis, extra: product);
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
              child: Stack(
                children: [
                  Hero(
                    tag: product.id ?? '',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        product.image ?? '',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 5,
                    right: 5,
                    child: IconButton(
                      onPressed: () {
                        context.read<WishlistCubit>().toggleWishlist(product);
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.black.withValues(alpha: .4),
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(35, 35),
                      ),
                      icon: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color: isFav ? AppColors.errorColor : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(10),
            Text(product.name ?? '', maxLines: 2, style: AppTextStyle.body),
            const Gap(10),
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
                          minimumSize: const Size(30, 30),
                        ),
                        icon: Icon(Icons.delete, color: AppColors.errorColor),
                      )
                    : SizedBox(
                        height: 30,
                        child: MainButton(
                          minWigth: 70,
                          minHeight: 30,
                          text: 'Buy',
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
