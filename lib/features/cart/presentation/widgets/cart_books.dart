import 'package:book_ia/core/widget/shimmer/list_view_shimmer.dart';
import 'package:book_ia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:book_ia/features/cart/presentation/cubit/cart_state.dart';
import 'package:book_ia/features/cart/presentation/widgets/cart_itme_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBooks extends StatelessWidget {
  const CartBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is! CartSuccessState) {
          return ListViewShimmer();
        } else {
          var cubit = context.read<CartCubit>();
          if (cubit.products.isEmpty) {
            return const Center(child: Text('No books in cart'));
          }
          return ListView.builder(
            itemCount: cubit.products.length,
            itemBuilder: (context, index) {
              return CartItmeWidget(
                item: cubit.products[index],
                onRemove: () {
                  cubit.removeFromCart(cubit.products[index].itemId ?? 0);
                },
                onUpdate: (count) {
                  cubit.updateCart(cubit.products[index].itemId ?? 0, count);
                },
              );
            },
          );
        }
      },
    );
  }
}
