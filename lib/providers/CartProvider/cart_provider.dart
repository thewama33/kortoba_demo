// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kortoba_demo/providers/CartProvider/cart_state.dart';

import '../../models/ProductsModel/products_model.dart';

class CartProvider extends ChangeNotifier {
  CartProvider();

  List<Results>? cartList = [];

  addToCart(Results model) {
    cartList?.add(model);
    notifyListeners();
  }

  removeItem(int index) {
    cartList?.removeAt(index);
    notifyListeners();
  }

  double cartTotalCost(List<Results> cart) {
    double total = 0;
    for (var i in cart) {
      total += double.parse(i.price!);
    }
    notifyListeners();
    return total;
  }
}

final cartProvider = ChangeNotifierProvider<CartProvider>((ref) {
  return CartProvider();
});
