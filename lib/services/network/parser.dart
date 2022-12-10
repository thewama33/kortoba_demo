import 'package:kortoba_demo/models/CategoryModel/category_model.dart';
import 'package:kortoba_demo/models/LoginModel/login_response.dart';
import 'package:kortoba_demo/models/ProductsModel/products_model.dart';

import '../../models/CategoryModel/category_item_model.dart';
import '../../models/RegisterModel/register_response.dart';

class Parser {
  static parse<T>(dynamic json) {
    switch (T) {
      case CategoryResponseModel:
        return CategoryResponseModel.fromJson(json);
      case ProductsResponse:
        return ProductsResponse.fromJson(json);
      case RegisterResponse:
        return RegisterResponse.fromJson(json);
      case LoginResponse:
        return LoginResponse.fromJson(json);
      case CategoryItemModel:
        return CategoryItemModel.fromJson(json);
    }
  }
}
