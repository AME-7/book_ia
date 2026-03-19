import 'package:book_ia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:book_ia/features/cart/presentation/widgets/cart_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCart(),
      child: Scaffold(
        appBar: AppBar(title: Text('Cart')),
        body: Padding(padding: const EdgeInsets.all(20), child: CartBooks()),
      ),
    );
  }
}
