import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/debug_prints.dart';
import '../../models/CategoryModel/category_item_model.dart';
import '../../models/CategoryModel/category_model.dart';
import '../../repos/category_repo.dart';
import '../../services/network/network_exceptions.dart';
import 'category_state.dart';

class CategoryItemID extends ChangeNotifier {
  
}


final categItemProvider = ChangeNotifierProvider<CategoryItemID>((ref) {
  return CategoryItemID();
});