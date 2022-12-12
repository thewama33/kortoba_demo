part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategorySuccessState extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryFailureState extends CategoryState {
  final String? errorMessage;

  CategoryFailureState([this.errorMessage]);
}

class ShowLoadingState extends CategoryState {}
