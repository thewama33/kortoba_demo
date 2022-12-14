import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_demo/core/colors.dart';
import 'package:kortoba_demo/core/extentions.dart';
import 'package:kortoba_demo/presentation/components/base/cached_image_network.dart';
import 'package:kortoba_demo/presentation/pages/DetailedPage/detailed_page.dart';
import 'package:kortoba_demo/providers/CartProvider/cart_provider.dart';

import '../../../../providers/ProductsProvider/products_provider.dart';
import '../../../../providers/ProductsProvider/products_state.dart';

class HomePopularList extends StatelessWidget {
  const HomePopularList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: Consumer(builder: (ctxt, ref, child) {
      final state = ref.watch(homeProvider);
      final provider = ref.watch(cartProvider);
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
                  aspectRatio: 0.6,
                  child: Container(
                    margin: REdgeInsets.all(12),
                    child: Column(
                      children: [
                        Stack(children: [
                          Center(
                            child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8)),
                                child: buildCacheNetworkImage(
                                    height: 150.h,
                                    width: 200.w,
                                    url:
                                        "${state.itemModel!.results![i].imageLink}")),
                          ),
                          Positioned(
                            right: 0,
                            top: 10,
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(6),
                                      bottomLeft: Radius.circular(6))),
                              padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                              child: Text(
                                  "${state.itemModel?.sale.toString()}%",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                            ),
                          ),
                        ]),
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  state.itemModel!.results![i].name!
                                      .capitalize()
                                      .replaceAll("-", " "),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: kTextColor,
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${state.itemModel?.results?[i].category?.name}",
                                  style: TextStyle(
                                      color: kTextColor,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.normal),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${state.itemModel?.results?[i].rate}",
                                      style: TextStyle(
                                          color: kTextColor,
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
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Row(
                            children: [
                              Text(
                                "${price.toInt()} جنيه",
                                style: TextStyle(
                                    color: kTextColor,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              IconButton(
                                icon: Icon(
                                  provider.isAddedToCart(
                                          state.itemModel!.results![i])
                                      ? Icons.done_outline
                                      : Icons.add,
                                  color: kSecondaryColor,
                                  size: 22,
                                ),
                                onPressed: () {
                                  if (!provider.isAddedToCart(
                                      state.itemModel!.results![i])) {
                                    ref.read(cartProvider).addToCart(
                                        state.itemModel!.results![i]);
                                  } else {
                                    ref.read(cartProvider).removeItem(
                                        state.itemModel!.results![i], i);
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
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
