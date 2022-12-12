import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortoba_demo/core/colors.dart';
import 'package:kortoba_demo/models/CategoryModel/category_model.dart';

import '../../../models/CategoryModel/category_items.dart';
import '../../../providers/CategoryProvider/category_provider.dart';
import '../../../providers/CategoryProvider/category_state.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer(
      builder: (context, ref, child) {
        var state = ref.read(categoryProvider);

        if (state is CategoryLoaded) {
          return ListView(
            children: [
              ...List.generate(
                  state.itemModel?.results!.length ?? 0,
                  (index) => CategoryListItem(
                      imageUrl: state.itemModel?.results![index].imageLink,
                      name: state.itemModel?.results![index].name,
                      id: state.itemModel?.results![index].id.toString()))
            ],
          );
        }
        if (state is CategoryError) {
          return Center(
            child: Text(state.message!),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }
}
