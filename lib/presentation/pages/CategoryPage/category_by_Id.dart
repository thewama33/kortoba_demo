// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_demo/core/appTheme.dart';

import 'package:kortoba_demo/presentation/components/base/form_error.dart';
import 'package:kortoba_demo/presentation/components/base/item_card.dart';
import 'package:kortoba_demo/providers/CategoryProvider/category_provider.dart';
import 'package:kortoba_demo/providers/CategoryProvider/category_state.dart';

import '../DetailedPage/detailed_page.dart';

class CategoryItemData extends ConsumerWidget {
  int? id;
  CategoryItemData({
    this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(categItemIDProvider(id!));

    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Category",
              style: textTheme().displayLarge,
            )),
        body: state.when(
          data: (data) {
            return SizedBox(
                child: Center(
                    child: data!.results!.isNotEmpty
                        ? ListView(
                            children: [
                              ...List.generate(data.results!.length, (index) {
                                return SizedBox(
                                  width: double.infinity,
                                  height: 200,
                                  child: ItemCard(
                                     
                                      imgUrl: data.results![index].imageLink!,
                                      courseName: data.results![index].name!,
                                      courseInfo:
                                          data.results![index].description!,
                                      coursePrice: data.results![index].price!),
                                );
                              })
                            ],
                          )
                        : const Center(
                            child: Text("Category Data is Empty"),
                          )));
          },
          error: (error, stackTrace) {
            return Center(child: Text(error.toString()));
          },
          loading: () {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          },
        ));
  }
}
