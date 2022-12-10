import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortoba_demo/core/colors.dart';
import 'package:kortoba_demo/models/CategoryModel/category_model.dart';

import '../../../models/CategoryModel/category_items.dart';
import '../../../providers/category_provider.dart';

class CategoryPage extends ConsumerWidget {
  CategoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var provier = ref.read(categoryProvider).categoryResponseModel;

    return Scaffold(
      body: ListView(
                children: [
                  ...List.generate(
                      provier?.results!.length ?? 0,
                      (index) => CategoryListItem(
                          imageUrl: provier?.results![index].imageLink,
                          name: provier?.results![index].name,
                          id: provier?.results![index].id.toString()))
                ],
              )
    );
  }
}
