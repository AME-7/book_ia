import 'package:book_ia/core/functions/navigations.dart';
import 'package:book_ia/core/styles/text_style.dart';
import 'package:book_ia/features/orders/place_order/data/models/governorate.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

void showGovernorateBottomSheet(
  BuildContext context,
  List<Governorate> governorates,
  Function(Governorate) onSelected,
) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(16),
          Text('Select Governorate', style: AppTextStyle.title),
          const Gap(16),
          Expanded(
            child: ListView.separated(
              itemCount: governorates.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final governorate = governorates[index];
                return ListTile(
                  title: Text(
                    governorate.governorateNameEn ?? '',
                    style: AppTextStyle.body,
                  ),
                  onTap: () {
                    onSelected(governorate);
                    pop(context);
                  },
                );
              },
            ),
          ),
        ],
      );
    },
  );
}
