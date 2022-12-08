import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_demo/providers/home_provider.dart';

class HomeCategoryList extends ConsumerWidget {
  int currentSelected = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var provider = ref.read(homeProvider);

    return SliverToBoxAdapter(
        child: SizedBox(
            height: 90.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: provider.productsModel?.results?.length ?? 0,
              itemBuilder: (ctx, i) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    onTap: () {
                      currentSelected = i;
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Container(
                        //   height: 60,
                        //   width: 70,
                        //   decoration: BoxDecoration(
                        //     color:
                        //         currentSelected == i ? darkGrey : lightGrey,
                        //     borderRadius: BorderRadius.circular(15),
                        //     // image: DecorationImage(
                        //     //   image: NetworkImage(state
                        //     //       .categoryModel!.results![i].imageLink! ?? ""),
                        //     //   fit: BoxFit.cover,
                        //     //   colorFilter: ColorFilter.mode(
                        //     //     currentSelected == i
                        //     //         ? Colors.black.withOpacity(.5)
                        //     //         : Colors.black.withOpacity(.85),
                        //     //     BlendMode.darken,
                        //     //   ),
                        //     // ),
                        //   ),
                        //   alignment: Alignment.center,
                        //   child: Icon(
                        //     Icons.category,
                        //     color: currentSelected == i ? Colors.white : grey,
                        //   ),
                        // ),
                        const SizedBox(height: 5),
                        Text(
                          "state.categoryModel!.results![i].name!",
                          style: TextStyle(
                            fontWeight: currentSelected == i
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )));
  }
}
