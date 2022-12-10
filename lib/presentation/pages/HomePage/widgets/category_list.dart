// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:kortoba_demo/providers/category_provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/colors.dart';
import '../../../../models/CategoryModel/category_model.dart';

class HomeCategoryList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var provider = ref.watch(categoryProvider);

    return SliverToBoxAdapter(
      child: FutureBuilder<CategoryResponseModel?>(
        future: provider.getCategory(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return AnimatedContainer(
              height: snapshot.hasError ? 0.h : 150.h,
              duration: kAnimationDuration,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data?.results?.length,
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
                                  snapshot.data?.results![i].imageLink ?? ""),
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
                          snapshot.data!.results![i].name!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
