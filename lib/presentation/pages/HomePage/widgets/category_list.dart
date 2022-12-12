// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:kortoba_demo/providers/CategoryProvider/category_provider.dart';
import 'package:kortoba_demo/providers/CategoryProvider/category_state.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/colors.dart';
import '../../../../models/CategoryModel/category_model.dart';

class HomeCategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: AnimatedContainer(
      height: 150.h,
      duration: kAnimationDuration,
      child: Consumer(
        builder: (context, ref, child) {
          var state = ref.watch(categoryProvider);

          if (state is CategoryLoaded) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: state.itemModel?.results?.length,
              itemBuilder: (ctx, i) {
                return RPadding(
                  padding: REdgeInsets.all(10.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 90.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                          color: lightGrey,
                          borderRadius: BorderRadius.circular(15.r),
                          image: DecorationImage(
                            image: NetworkImage(
                                state.itemModel?.results![i].imageLink ?? ""),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(.5),
                              BlendMode.darken,
                            ),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: SizedBox(),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        state.itemModel!.results![i].name!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is CategoryError) {
            return Center(child: Text(state.message!));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    ));
  }
}
