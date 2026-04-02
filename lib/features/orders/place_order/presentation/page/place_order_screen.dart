import 'package:book_ia/core/functions/navigations.dart';
import 'package:book_ia/core/routes/routes.dart';
import 'package:book_ia/core/styles/text_style.dart';
import 'package:book_ia/core/widget/custom_back_button.dart';
import 'package:book_ia/core/widget/custom_text_form_field.dart';
import 'package:book_ia/core/widget/main_button.dart';
import 'package:book_ia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:book_ia/features/home/data/models/best_seller_book_response/product.dart';
import 'package:book_ia/features/orders/place_order/presentation/cubit/governorate_cubit.dart';
import 'package:book_ia/features/orders/place_order/presentation/cubit/governorate_state.dart';
import 'package:book_ia/features/orders/place_order/presentation/widgets/gav_bottom_sheet.dart';
import 'package:book_ia/features/orders/place_order/presentation/widgets/order_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class PlaceOrderScreen extends StatefulWidget {
  final String total;

  const PlaceOrderScreen({super.key, required this.total});

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  final _governorateController = TextEditingController();
  int? _selectedGovernorateId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlaceOrderCubit()..getGovernorates(),
      child: BlocListener<PlaceOrderCubit, PlaceOrderState>(
        listener: (context, state) async {
          if (state is PlaceOrderSuccessState) {
            /// ✅ خد نسخة من الكارت (مهم)
            final cartItems = List<Product>.from(
              context.read<CartCubit>().items,
            );

            print('CART ITEM COUNT: ${cartItems.length}');

            await OrderCache.saveOrder(cartItems);

            if (!mounted) return;

            pushTo(context, Routes.success);
          } else if (state is PlaceOrderErrorState) {
            if (!mounted) return;

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Something went wrong")),
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const CustomBackButton(),
            automaticallyImplyLeading: false,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Place Your Order', style: AppTextStyle.headline),
                    const Gap(28),

                    CustomTextFormField(
                      controller: _fullNameController,
                      hintText: 'Full Name',
                      validator: (v) => v!.isEmpty ? 'Enter your name' : null,
                    ),

                    const Gap(16),

                    CustomTextFormField(
                      controller: _emailController,
                      hintText: 'Email',
                      validator: (v) =>
                          v!.contains('@') ? null : 'Invalid email',
                    ),

                    const Gap(16),

                    CustomTextFormField(
                      controller: _addressController,
                      hintText: 'Address',
                      validator: (v) => v!.isEmpty ? 'Enter address' : null,
                    ),

                    const Gap(16),

                    CustomTextFormField(
                      controller: _phoneController,
                      hintText: 'Phone',
                      keybordType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),

                    const Gap(16),

                    /// Governorate
                    BlocBuilder<PlaceOrderCubit, PlaceOrderState>(
                      builder: (context, state) {
                        return CustomTextFormField(
                          controller: _governorateController,
                          hintText: 'Governorate',
                          readOnly: true,
                          onTap: () {
                            var cubit = context.read<PlaceOrderCubit>();
                            if (state is GovernoratesSuccessState) {
                              showGovernorateBottomSheet(
                                context,
                                cubit.governorates,
                                (selectedGov) {
                                  setState(() {
                                    _selectedGovernorateId = selectedGov.id;
                                    _governorateController.text =
                                        selectedGov.governorateNameEn ?? '';
                                  });
                                },
                              );
                            }
                          },
                          validator: (v) =>
                              v!.isEmpty ? 'Select governorate' : null,
                        );
                      },
                    ),

                    const Gap(32),

                    Row(
                      children: [
                        Text('Total:', style: AppTextStyle.subtitle1),
                        const Spacer(),
                        Text(
                          '\$ ${widget.total}',
                          style: AppTextStyle.subtitle1,
                        ),
                      ],
                    ),

                    const Gap(20),

                    BlocBuilder<PlaceOrderCubit, PlaceOrderState>(
                      builder: (context, state) {
                        if (state is PlaceOrderLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return MainButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<PlaceOrderCubit>().placeOrder(
                                name: _fullNameController.text,
                                email: _emailController.text,
                                address: _addressController.text,
                                phone: _phoneController.text,
                                governorateId: _selectedGovernorateId!,
                              );
                            }
                          },
                          text: 'Submit Order',
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
