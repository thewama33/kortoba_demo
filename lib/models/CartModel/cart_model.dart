// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:kortoba_demo/models/ProductsModel/products_model.dart';

class CartModel {
  final Results cartList;
  final int numOfItem;
  CartModel({
    required this.cartList,
    required this.numOfItem,
  });
  
}
