import 'package:book_ia/core/styles/colors.dart';
import 'package:book_ia/core/styles/text_style.dart';
import 'package:book_ia/core/widget/custom_back_button.dart';
import 'package:book_ia/core/widget/main_button.dart';
import 'package:book_ia/features/detalis/presentation/widgets/wishlist_icon.dart';
import 'package:book_ia/features/home/data/models/best_seller_book_response/product.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DetalisScreen extends StatelessWidget {
  const DetalisScreen({super.key, required this.model});
  final Product model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomBackButton(),
        actions: [WishlistActionWidget(id: model.id ?? 0)],
      ),

      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: model.id ?? '',
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10),
                  child: Image.network(
                    model.image ?? '',
                    width: 180,
                    height: 270,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Gap(11),
              Text(
                model.name ?? '',
                style: AppTextStyle.headline,
                textAlign: TextAlign.center,
              ),
              Gap(10),
              Text(
                model.category ?? '',
                style: AppTextStyle.captoin1.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              Gap(20),
              Text(
                model.description ?? '',
                textAlign: TextAlign.justify,
                style: AppTextStyle.caption2.copyWith(
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsetsGeometry.fromLTRB(22, 5, 22, 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${model.price}\$', style: AppTextStyle.title),
            MainButton(
              minWigth: 200,
              text: 'Add to cart',
              onPressed: () {},
              bgColor: AppColors.blackColor,
            ),
          ],
        ),
      ),
    );
  }
}
