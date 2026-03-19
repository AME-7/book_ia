import 'package:book_ia/core/functions/navigations.dart';
import 'package:book_ia/core/styles/colors.dart';
import 'package:book_ia/core/widget/dialogs.dart';
import 'package:book_ia/core/widget/main_button.dart';
import 'package:book_ia/features/detalis/presentation/widgets/cart_action/cubit/cart_action_cubit.dart';
import 'package:book_ia/features/detalis/presentation/widgets/cart_action/cubit/cart_action_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartActionWidget extends StatelessWidget {
  const CartActionWidget({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartActionCubit(),
      child: BlocConsumer<CartActionCubit, CartActionState>(
        listener: (context, state) {
          if (state is CartActionsSuccessState) {
            pop(context);
            showMyDialog(context, state.msg, type: DialogType.success);
          } else if (state is CartActionsErrorState) {
            pop(context);
            showMyDialog(context, 'Something went wrong');
          } else if (state is CartActionsLoadingState) {
            showLoadingDialog(context);
          }
        },
        builder: (context, state) {
          var cubit = context.read<CartActionCubit>();
          bool isInCart = cubit.isProductInCart(id);
          return MainButton(
            bgColor: isInCart ? AppColors.primaryColor : AppColors.blackColor,
            minWigth: 200,
            text: isInCart ? 'Added to cart' : 'Add to cart',
            onPressed: () {
              if (!cubit.isProductInCart(id)) {
                context.read<CartActionCubit>().addToCart(id);
              }
            },
          );
        },
      ),
    );
  }
}
