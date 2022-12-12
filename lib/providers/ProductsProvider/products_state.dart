// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:kortoba_demo/models/ProductsModel/products_model.dart';

abstract class ProductsState {}

class ProductsInitial extends ProductsState {
  ProductsInitial();
}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  ProductsResponse? itemModel;
  ProductsLoaded({
    this.itemModel,
  });
}

class ProductsError extends ProductsState {
  String? message;
  ProductsError({
    this.message,
  });
}
