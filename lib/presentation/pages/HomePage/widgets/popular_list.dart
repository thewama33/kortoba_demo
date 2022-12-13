import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_demo/core/colors.dart';
import 'package:kortoba_demo/core/extentions.dart';
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
          height: 370.h,
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
                    decoration: BoxDecoration(
                        border: Border.all(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CachedNetworkImage(
                                  width: 230,
                                  height: 150,
                                  fit: BoxFit.cover,
                                  imageUrl:
                                      "${state.itemModel!.results![i].imageLink}"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                state.itemModel!.results![i].name!.capitalize(),
                                overflow: TextOverflow.clip,
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
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                child: Row(
                                  children: [
                                    const Spacer(),
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
                              ),
                            ],
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
