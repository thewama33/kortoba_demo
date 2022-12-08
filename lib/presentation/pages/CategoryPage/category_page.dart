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
    var provier = ref.read(categoryProvider);

    return Scaffold(
      body: FutureBuilder<CategoryResponseModel?>(
          future: provier.getCategory(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
             CategoryResponseModel dataCateg = snapshot.data;
              return  ListView(
                children: [
                  ...List.generate(
                      dataCateg.results!.length,
                      (index) => CategoryListItem(
                          imageUrl: dataCateg.results![index].imageLink,
                          name: dataCateg.results![index].name,
                          id: dataCateg.results![index].id.toString()))
                ],
              );
            }

            return const Center(child: CircularProgressIndicator(backgroundColor: kPrimaryColor,));
          }),
    );
  }
}
