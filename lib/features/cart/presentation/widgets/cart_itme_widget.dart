import 'package:book_ia/core/styles/colors.dart';
import 'package:book_ia/core/styles/text_style.dart';
import 'package:book_ia/core/widget/dialogs.dart';
import 'package:book_ia/features/cart/data/model/cart_response/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CartItmeWidget extends StatelessWidget {
  const CartItmeWidget({
    super.key,
    required this.item,
    this.onRemove,
    this.onUpdate,
  });

  final CartItem item;
  final Function()? onRemove;
  final Function(int)? onUpdate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(10),
            child: Image.network(
              item.itemProductImage ?? "",
              height: 120,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          Gap(15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            '${item.itemProductName}',
                            style: AppTextStyle.subtitle2,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Gap(5),
                          Text(
                            '${item.itemProductPriceAfterDiscount} \$',
                            style: AppTextStyle.body.copyWith(
                              color: AppColors.darkgreyColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: AppColors.errorColor),
                      onPressed: onRemove,
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        int quantity = (item.itemQuantity ?? 0);
                        var updatedCount = quantity - 1;
                        if (quantity > 1) {
                          onUpdate!(updatedCount);
                        } else {
                          showMyDialog(context, 'Cannot remove less then 1');
                        }
                      },
                      icon: Icon(Icons.remove),
                    ),
                    Text('${item.itemQuantity}'),
                    IconButton(
                      onPressed: () {
                        int quantity = (item.itemQuantity ?? 0);
                        var updatedCount = quantity + 1;
                        if (updatedCount < (item.itemProductStock ?? 0)) {
                          onUpdate!(updatedCount);
                        } else {
                          showMyDialog(context, 'Cannot add more than stock');
                        }
                      },
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
