import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortoba_demo/core/debug_prints.dart';
import 'package:kortoba_demo/models/ProductsModel/products_model.dart';
import 'package:kortoba_demo/services/network/network_exceptions.dart';

import '../../repos/home_repo.dart';
import 'products_state.dart';

class HomeProvider extends StateNotifier<ProductsState> {
  final HomeRepo? homeRepo = HomeRepo();
  ProductsResponse? productsModel;

  HomeProvider() : super(ProductsInitial()) {
    getProducts();
  }

  Future<ProductsResponse?> getProducts() async {
    print("Getting Products");

    state = ProductsLoading();
    try {
      productsModel = await homeRepo?.getProducts();
      if (productsModel != null) {
        state = ProductsLoaded(itemModel: productsModel);
        return productsModel;
      }
    } on DioError catch (error) {
      state = ProductsError(message: handleError(error));
      printError(handleError(error));
    }

    return productsModel;
  }
}

final homeProvider = StateNotifierProvider((ref) {
  return HomeProvider();
});
