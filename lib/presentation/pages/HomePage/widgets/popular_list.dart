import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_demo/core/colors.dart';
import 'package:kortoba_demo/core/extentions.dart';
import 'package:kortoba_demo/presentation/pages/DetailedPage/detailed_page.dart';

import '../../../../providers/ProductsProvider/products_provider.dart';
import '../../../../providers/ProductsProvider/products_state.dart';

class HomePopularList extends StatelessWidget {
  const HomePopularList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: Consumer(builder: (ctxt, ref, child) {
      final state = ref.watch(homeProvider);
      if (state is ProductsLoaded) {
        return SizedBox(
          height: 350.h,
          child: ListView.builder(
            shrinkWrap: true,
            addAutomaticKeepAlives: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: state.itemModel!.results!.length > 5
                ? 5
                : state.itemModel?.results?.length,
            itemBuilder: (context, i) {
              double price = double.parse(state.itemModel!.results![i].price!);

              return InkWell(
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(
                    builder: (context) {
                      return DetailsScreen(
                        index: i,
                      );
                    },
                  ));
                },
                child: AspectRatio(
                  aspectRatio: .8,
                  child: Container(
                    margin: REdgeInsets.all(8),
                    decoration: BoxDecoration(
                        gradient: grads,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CachedNetworkImage(
                                  width: 100,
                                  height: 150,
                                  fit: BoxFit.cover,
                                  imageUrl:
                                      "${state.itemModel!.results![i].imageLink}"),
                            ),
                          ),
                          Text(
                            state.itemModel!.results![i].name!.capitalize(),
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${state.itemModel?.results?[i].category?.name}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.normal),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${state.itemModel?.results?[i].rate}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w100),
                              ),
                              const Icon(
                                Icons.star,
                                color: kSecondaryColor,
                                size: 20,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "${price.toInt()} جنيه",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.add,
                                  color: kSecondaryColor,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }
      if (state is ProductsLoading) {
        return const Center(
          child: CircularProgressIndicator(backgroundColor: kPrimaryColor),
        );
      }

      if (state is ProductsError) {
        return Center(
          child: Text(state.message!),
        );
      }
      return Container();
    }));
  }
}
