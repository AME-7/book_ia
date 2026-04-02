import 'package:book_ia/core/functions/navigations.dart';
import 'package:book_ia/core/routes/routes.dart';
import 'package:book_ia/core/styles/colors.dart';
import 'package:book_ia/features/orders/order_history/presentation/cubit/order_cubit.dart';
import 'package:book_ia/features/orders/order_history/presentation/cubit/order_state.dart';
import 'package:book_ia/features/orders/place_order/presentation/widgets/order_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersCubit()..getOrders(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,

        appBar: AppBar(
          title: const Text("My Orders"),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              pop(context);
            },
          ),
        ),

        body: BlocBuilder<OrdersCubit, OrdersState>(
          builder: (context, state) {
            var cubit = context.read<OrdersCubit>();

            if (state is OrdersLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: cubit.orders.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final order = cubit.orders[index];

                return GestureDetector(
                  onTap: () async {
                    print('ORDER ID FROM LIST : ${order.id}');
                    final items = await OrderCache.getOrder();
                    print('LOADED ITEM : ${items.length}');
                    pushTo(
                      context,
                      Routes.orderDetails,
                      extra: {'order': order, 'items': items},
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Order No${order.orderCode}",
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              order.date,
                              style: const TextStyle(
                                color: AppColors.greyColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Divider(),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Total Amount",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "\$${order.total}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
