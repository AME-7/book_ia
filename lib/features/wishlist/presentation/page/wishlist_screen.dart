import 'package:book_ia/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:book_ia/features/wishlist/presentation/widgets/wishlist_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishlistCubit()..getWishlist(),
      child: Scaffold(
        appBar: AppBar(title: Text('wishlist')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: WishlistBooks(),
        ),
      ),
    );
  }
}
