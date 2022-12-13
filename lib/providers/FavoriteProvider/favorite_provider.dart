import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortoba_demo/models/ProductsModel/products_model.dart';

class FavoriteProvider extends ChangeNotifier {
  List<ProductsResults>? favoriteList = [];

  bool isFavoriterd(ProductsResults model) {
    return favoriteList!.contains(model);
  }

  addToFavorite(ProductsResults model) {
    if (!favoriteList!.contains(model)) {
      favoriteList?.add(model);
    }
    notifyListeners();
  }

  removeItem(ProductsResults model) {
    if (favoriteList!.isNotEmpty) {
      favoriteList?.removeWhere((element) => model.id == element.id);
    }
    notifyListeners();
  }
}

final favoriteProvider = ChangeNotifierProvider<FavoriteProvider>((ref) {
  return FavoriteProvider();
});
