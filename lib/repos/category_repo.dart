import 'package:kortoba_demo/models/CategoryModel/category_item_model.dart';

import '../core/end_points.dart';
import '../models/CategoryModel/category_model.dart';
import 'base/base_repo.dart';

class CategoriesRepo extends BaseRepo {
  Future<CategoryResponseModel?> getCategories() {
    return networkManager.get<CategoryResponseModel>(Endpoints.GET_CATEGORIES);
  }

  Future<CategoryItemModel?> getCategoryByID(int id) {
    return networkManager
        .get<CategoryItemModel>("${Endpoints.GET_CATEGORIES_BY_ID}$id");
  }
}
