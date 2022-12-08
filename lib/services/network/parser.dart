import 'package:kortoba_demo/models/CategoryModel/category_model.dart';
import 'package:kortoba_demo/models/LoginModel/login_response.dart';

import '../../models/RegisterModel/register_response.dart';

class Parser {
  static parse<T>(dynamic json) {
    switch (T) {
      case CategoryResponseModel:
        return CategoryResponseModel.fromJson(json);
      case RegisterResponse:
        return RegisterResponse.fromJson(json);
      case LoginResponse:
        return LoginResponse.fromJson(json);
    }
  }
}
