import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_demo/core/colors.dart';
import 'package:kortoba_demo/providers/category_provider.dart';

import '../../../models/CategoryModel/category_item_model.dart';

class CategoryItemsData extends ConsumerWidget {
  CategoryItemsData({super.key, required this.id});

  int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var provider = ref.read(categItemProvider);
    return Scaffold(
      body: Container(
          child: Center(
              child: provider.when(
        data: (data) {
          return Column(
            children: [
              CachedNetworkImage(
                imageUrl: data.imageLink!,
                height: 250.h,
                fit: BoxFit.cover,
              ),
              ListTile(
                title: Text(data.name!),
                subtitle: Text(data.description!),
                leading: Text("${data.id}"),
                trailing: Text("${data.price}"),
              )
            ],
          );
        },
        error: (error, stackTrace) {
          return Text("${error}");
        },
        loading: () => const CircularProgressIndicator(
          backgroundColor: kPrimaryColor,
        ),
      ))),
    );
  }
}
