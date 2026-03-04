import 'package:book_ia/core/styles/colors.dart';
import 'package:flutter/material.dart';

class QtyButton extends StatelessWidget {
  final IconData icon;
  final bool isAdd;
  final Function()? onTap;

  const QtyButton({
    super.key,
    required this.icon,
    this.isAdd = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Icon(icon, color: isAdd ? AppColors.primaryColor : Colors.grey),
      ),
    );
  }
}
