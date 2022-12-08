import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_demo/providers/category_provider.dart';

import '../../../models/CategoryModel/category_item_model.dart';

class CategoryItemsData extends ConsumerWidget {
  CategoryItemsData({super.key, required this.id});

  int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var provider = ref.read(categoryProvider);
    return Container(
      child: Center(
        child: FutureBuilder<CategoryItemModel?>(
          future: provider.getCategoriesByID(id),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              CategoryItemModel categID = snapshot.data;
              return Column(
              children: [
                CachedNetworkImage(
                  imageUrl: categID.imageLink!,
                  height: 250.h,
                  fit: BoxFit.cover,
                ),
                ListTile(
                  title: Text(categID.name!),
                  subtitle: Text(categID.description!),
                  leading: Text("${categID.id}"),
                  trailing: Text("${categID.price}"),
                )
              ],
            );
            }
            
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
