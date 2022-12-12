import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_demo/core/colors.dart';
import 'package:kortoba_demo/providers/CategoryProvider/category_by_Id.dart';
import 'package:kortoba_demo/providers/CategoryProvider/category_provider.dart';
import 'package:kortoba_demo/providers/CategoryProvider/category_state.dart';

import '../../../models/CategoryModel/category_item_model.dart';

class CategoryItemData extends ConsumerStatefulWidget {
  CategoryItemData({super.key, required this.id});

  String id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CategoryItemDataState();
}

class _CategoryItemDataState extends ConsumerState<CategoryItemData> {
  @override
  void initState() {
    ref.read(categItemProvider).getCategoriesByID(int.parse(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(categItemProvider);

    if (state.categItemModel != null) {
      return Scaffold(
          body: Container(
        child: Center(
            child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: state.categItemModel!.imageLink!,
              height: 250.h,
              fit: BoxFit.cover,
            ),
            ListTile(
              title: Text(state.categItemModel!.name!),
              subtitle: Text(state.categItemModel!.description!),
              leading: Text("${state.categItemModel!.id}"),
              trailing: Text("${state.categItemModel!.price}"),
            )
          ],
        )),
      ));
    }
    return CircularProgressIndicator();
  }
}
