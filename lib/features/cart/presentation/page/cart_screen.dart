import 'package:book_ia/features/cart/presentation/widgets/cart_books.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Padding(padding: const EdgeInsets.all(20), child: CartBooks()),
    );
  }
}
