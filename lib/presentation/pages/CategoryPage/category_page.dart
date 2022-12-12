import 'package:flutter/material.dart';

import '../../../models/CategoryModel/category_items.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic provider;
    return Scaffold(body: Container());
    //     body: ListView(
    //   children: [
    //     ...List.generate(
    //         provier?.results!.length ?? 0,
    //         (index) => CategoryListItem(
    //             imageUrl: provier?.results![index].imageLink,
    //             name: provier?.results![index].name,
    //             id: provier?.results![index].id.toString()))
    //   ],
    // ));
  }
}
