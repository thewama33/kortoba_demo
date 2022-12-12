part of 'products_bloc.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}


class ProductsSuccessState extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsFailureState extends ProductsState {
  final String? errorMessage;

  ProductsFailureState([this.errorMessage]);
}

class ShowLoadingState extends ProductsState {}