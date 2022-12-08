import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortoba_demo/core/debug_prints.dart';
import 'package:kortoba_demo/models/ProductsModel/products_model.dart';
import '../repos/home_repo.dart';

class HomeProvider extends ChangeNotifier {
  HomeRepo? homeRepo = HomeRepo();
ProductsModel? productsModel;

  Future<ProductsModel?> getProducts() async {
    try {
      //print(loginRepo.requestLogin(email,password));
       productsModel = await homeRepo?.getHome();
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

final homeProvider = ChangeNotifierProvider<HomeProvider>((ref) {
  return HomeProvider();
});
