// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {}

class CartError extends CartState {
  final String? error;
  CartError({
    this.error,
  });
}
