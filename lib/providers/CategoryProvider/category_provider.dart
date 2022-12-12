// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kortoba_demo/models/CategoryModel/category_item_model.dart';

import '../../core/debug_prints.dart';
import '../../models/CategoryModel/category_model.dart';
import '../../repos/category_repo.dart';
import '../../services/network/network_exceptions.dart';
import 'category_state.dart';

class CategoryProvider extends StateNotifier<CategoryState> {
  CategoryResponseModel? categoryResponseModel;
 

  CategoryProvider() : super(CategoryInitial()) {
    getCategory();
  }
  CategoriesRepo? categoryRepo = CategoriesRepo();

  Future<CategoryResponseModel?> getCategory() async {
    state = CategoryLoading();
    try {
      //print(loginRepo.requestLogin(email,password));
      categoryResponseModel = await categoryRepo?.getCategories();
      if (categoryResponseModel != null) {
        state = CategoryLoaded(itemModel: categoryResponseModel);
        return categoryResponseModel;
      }
    } on DioError catch (error) {
      printError(handleError(error));
      state = CategoryError(message: handleError(error));
    }
    return categoryResponseModel;
  }

  
}

final categoryProvider =
    StateNotifierProvider<CategoryProvider, CategoryState>((ref) {
  return CategoryProvider();
});
