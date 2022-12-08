import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortoba_demo/models/CategoryModel/category_item_model.dart';
import '../core/debug_prints.dart';
import '../models/CategoryModel/category_model.dart';
import '../repos/category_repo.dart';

class CategoryProvider extends ChangeNotifier {
  CategoryResponseModel? categoryResponseModel;
  CategoryItemModel? categItemModel;
  CategoriesRepo? categoryRepo = CategoriesRepo();

  Future<CategoryResponseModel?> getCategory() async {
    try {
      //print(loginRepo.requestLogin(email,password));
      categoryResponseModel = await categoryRepo?.getCategories();
      if (categoryResponseModel != null) {
        return categoryResponseModel;
      }
      notifyListeners();
    } on DioError catch (error) {
      printError(error);
    }
    notifyListeners();
    return categoryResponseModel;
  }

  Future<CategoryItemModel?> getCategoriesByID(int id) async {
    try {
      categItemModel = await categoryRepo?.getCategoryByID(id);
      if (categoryResponseModel != null) {
        return categItemModel;
      }
      notifyListeners();
    } on DioError catch (error) {
      printError(error);
    }
    notifyListeners();
    return categItemModel;
  }
}

final categoryProvider = ChangeNotifierProvider<CategoryProvider>((ref) {
  return CategoryProvider();
});
