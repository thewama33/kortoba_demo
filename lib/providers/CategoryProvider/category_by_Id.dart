import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/debug_prints.dart';
import '../../models/CategoryModel/category_item_model.dart';
import '../../models/CategoryModel/category_model.dart';
import '../../repos/category_repo.dart';
import '../../services/network/network_exceptions.dart';
import 'category_state.dart';

class CategoryItemID extends ChangeNotifier {
  CategoryItemModel? categItemModel;
  CategoriesRepo? categoryRepo = CategoriesRepo();

  Future<CategoryItemModel?> getCategoriesByID(int id) async {
    notifyListeners();
    try {
      categItemModel = await categoryRepo?.getCategoryByID(id);
      if (categItemModel != null) {
        notifyListeners();
        return categItemModel;
      }
    } on DioExceptions catch (error) {
      printError(error);
      notifyListeners();
    }
    return categItemModel;
  }
}


final categItemProvider = ChangeNotifierProvider<CategoryItemID>((ref) {
  return CategoryItemID();
});