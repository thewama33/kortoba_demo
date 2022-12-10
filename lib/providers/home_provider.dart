import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortoba_demo/core/debug_prints.dart';
import 'package:kortoba_demo/models/ProductsModel/products_model.dart';
import '../repos/home_repo.dart';

class HomeProvider extends ChangeNotifier {
  HomeRepo? homeRepo = HomeRepo();
  ProductsResponse? productsModel;

  Future<ProductsResponse?> getProducts() async {
    print("Getting Products");
    try {
      productsModel = await homeRepo?.getProducts();
      if (productsModel != null) {
        return productsModel;
      }
      notifyListeners();
    } on DioError catch (error) {
      printError(error);
    }
    notifyListeners();
    return productsModel;
  }
}

final productsProvider = FutureProvider<ProductsResponse?>((ref) async {
  ProductsResponse? model = await ref.read(homeProvider.notifier).getProducts();
  
  return model!;
});

final homeProvider = ChangeNotifierProvider<HomeProvider>((ref) {
  return HomeProvider();
});
