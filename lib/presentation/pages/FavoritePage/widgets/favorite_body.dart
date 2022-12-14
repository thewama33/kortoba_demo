import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_demo/presentation/components/base/item_card.dart';
import 'package:kortoba_demo/providers/CartProvider/cart_provider.dart';
import 'package:kortoba_demo/providers/FavoriteProvider/favorite_provider.dart';

class FavoriteBody extends StatefulWidget {
  const FavoriteBody({super.key});

  @override
  State<FavoriteBody> createState() => _FavoriteBodyState();
}

class _FavoriteBodyState extends State<FavoriteBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Consumer(
        builder: (context, ref, child) {
          final provider = ref.watch(favoriteProvider);

          return provider.favoriteList!.isNotEmpty
              ? ListView.builder(
                  itemCount: provider.favoriteList?.length,
                  itemBuilder: (context, index) {
                    return RPadding(
                      padding: REdgeInsets.symmetric(vertical: 10.w),
                      child: Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          provider.removeItem(provider.favoriteList![index]);
                        },
                        background: Container(
                          padding: REdgeInsets.symmetric(horizontal: 20.r),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFE6E6),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Row(
                            children: const [
                              Spacer(),
                              Icon(
                                Icons.delete,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                        child: SizedBox(
                            width: double.infinity,
                            height: 200,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ItemCard(
                                  imgUrl:
                                      provider.favoriteList![index].imageLink!,
                                  courseName:
                                      provider.favoriteList![index].name!,
                                  courseInfo: provider
                                      .favoriteList![index].description!,
                                  coursePrice:
                                      provider.favoriteList![index].price!),
                            )),
                      ),
                    );
                  })
              : const Center(
                  child: Text("Favorite is Empty"),
                );
        },
      ),
    );
  }
}
