import 'package:flutter/material.dart';

import '../../../models/CategoryModel/category_items.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: ListView(
        children: [
          ...List.generate(
              categList.length,
              (index) => CategoryListItem(
                  imageUrl: categList[index].imageLink,
                  name: categList[index].name,
                  id: categList[index].id.toString()))
        ],
      ),
    );
  }
}
