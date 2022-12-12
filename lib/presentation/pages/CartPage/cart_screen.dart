import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortoba_demo/models/ProductsModel/products_model.dart';
import 'package:kortoba_demo/providers/CartProvider/cart_provider.dart';

import '../../../models/CartModel/cart_model.dart';
import 'widgets/body.dart';
import 'widgets/check_out_card.dart';

class CartPage extends ConsumerWidget {
  static String routeName = "/cart";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(cartProvider);
    return Scaffold(
      appBar: buildAppBar(context,provider.cartList!.length),
      body: Body(),
      bottomNavigationBar: CheckoutCard(totalCosts: provider.cartTotalCost(provider.cartList!)),
    );
  }

  AppBar buildAppBar(BuildContext context, count) {
    return AppBar(
      title: Column(
        children: [
          const Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "$count items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
