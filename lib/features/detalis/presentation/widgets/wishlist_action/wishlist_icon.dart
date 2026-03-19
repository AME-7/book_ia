import 'package:book_ia/core/constants/app_images.dart';
import 'package:book_ia/core/functions/navigations.dart';
import 'package:book_ia/core/styles/colors.dart';
import 'package:book_ia/core/widget/custom_svg_picture.dart';
import 'package:book_ia/core/widget/dialogs.dart';
import 'package:book_ia/features/detalis/presentation/widgets/wishlist_action/cubit/wishlist_action_cubit.dart';
import 'package:book_ia/features/detalis/presentation/widgets/wishlist_action/cubit/wishlist_action_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class WishlistActionWidget extends StatelessWidget {
  const WishlistActionWidget({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishlistActionCubit(),
      child: BlocConsumer<WishlistActionCubit, WishlistActionState>(
        listener: (context, state) {
          if (state is WishlistActionSuccessState) {
            pop(context);
            showMyDialog(context, state.msg, type: DialogType.success);
          } else if (state is WishlistActionErrorState) {
            pop(context);
            showMyDialog(context, 'Something went wrong');
          } else if (state is WishlistActionLoadingState) {
            showLoadingDialog(context);
          }
        },
        builder: (context, state) {
          var cubit = context.read<WishlistActionCubit>();
          return IconButton(
            onPressed: () {
              if (cubit.isProductInWishlist(id)) {
                cubit.removFromWishlist(id);
              } else {
                context.read<WishlistActionCubit>().addToWishlist(id);
              }
            },
            icon: cubit.isProductInWishlist(id)
                ? CustomSvgPicture(
                    path: AppImages.heartSvg,
                    color: AppColors.primaryColor,
                  )
                : SvgPicture.asset(AppImages.heartSvg),
          );
        },
      ),
    );
  }
}
