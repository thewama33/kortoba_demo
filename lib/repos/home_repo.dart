import 'package:kortoba_demo/models/ProductsModel/products_model.dart';

import '../core/end_points.dart';
import 'base/base_repo.dart';

class HomeRepo extends BaseRepo {
  Future<ProductsResponse?> getProducts() {
    return networkManager.get<ProductsResponse>(Endpoints.GET_PRODUCTS);
  }
}
