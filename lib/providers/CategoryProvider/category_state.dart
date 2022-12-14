

import 'package:kortoba_demo/models/CategoryModel/category_item_model.dart';
import 'package:kortoba_demo/models/CategoryModel/category_model.dart';

abstract class CategoryState {}


class CategoryInitial extends CategoryState {
  CategoryInitial();
}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  CategoryResponseModel? itemModel;
  CategoryLoaded({
    this.itemModel,
  });
}

class CategoryError extends CategoryState {
  String? message;
  CategoryError({
    this.message,
  });
}



class CategoryByIDLoaded extends CategoryState {
  CategoryItemModel? itemModel;
  CategoryByIDLoaded({
    this.itemModel,
  });
}