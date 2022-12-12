import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_demo/presentation/components/base/form_error.dart';
import 'package:kortoba_demo/providers/CategoryProvider/category_provider.dart';
import 'package:kortoba_demo/providers/CategoryProvider/category_state.dart';


class CategoryItemData extends ConsumerStatefulWidget {
  CategoryItemData({super.key, required this.id});

  int id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CategoryItemDataState();
}

class _CategoryItemDataState extends ConsumerState<CategoryItemData> {
  @override
  void initState() {
     WidgetsBinding.instance.addPostFrameCallback((_) {
    if (context == null) return;
    log('Navigating to SplashPage');
    ref.read(categoryProvider.notifier).getCategoriesByID(widget.id);
  });
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    final state = ref.watch(categoryProvider);

    if (state is CategoryByIDLoaded) {
      return Scaffold(
          body: Container(
        child: Center(
            child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: state.itemModel!.imageLink!,
              height: 250.h,
              fit: BoxFit.cover,
            ),
            ListTile(
              title: Text(state.itemModel!.name!),
              subtitle: Text(state.itemModel!.description!),
              leading: Text("${state.itemModel!.id}"),
              trailing: Text("${state.itemModel!.price}"),
            )
          ],
        )),
      ));
    }
    if (state is CategoryError) {
      return FormError(errors: [state.message]);
    }else 
     {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
  }
}
