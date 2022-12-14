// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortoba_demo/core/debug_prints.dart';
import '../../models/ProductsModel/products_model.dart';

class CartProvider extends ChangeNotifier {
  CartProvider();

  List<ProductsResults>? cartList = [];
  List<int> itemIndex = [];

  inc(int count) {
    count++;
    notifyListeners();
  }

  dec(int count) {
    if (count > 0) {
      count--;
    }
  }

  addToCart(ProductsResults model) {
    if (!cartList!.contains(model)) {
      cartList?.add(model);
      itemIndex.add(1);
    }

    printDone("Lenth of List is ${cartList!.length}");
    notifyListeners();
  }

  bool isAddedToCart(ProductsResults model) {
    return cartList!.contains(model);
  }

  removeItem(ProductsResults model, index) {
    if (cartList!.where((element) => element.id == model.id).length <= 1) {
      cartList?.removeWhere((element) => element.id == model.id);
    } else {
      cartList?.removeAt(index);
    }
    notifyListeners();
  }

  double cartTotalCost(List<ProductsResults> cart) {
    double total = 0;
    for (var i in cart) {
      total += double.parse(i.price!);
    }
    return total;
  }
}

final cartProvider = ChangeNotifierProvider<CartProvider>((ref) {
  return CartProvider();
});
