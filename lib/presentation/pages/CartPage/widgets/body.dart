import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_demo/providers/CartProvider/cart_provider.dart';

import 'cart_card.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Consumer(
        builder: (context, ref, child) {
          final provider = ref.watch(cartProvider);

          return provider.cartList!.isNotEmpty
              ? ListView.builder(
                  itemCount: provider.cartList?.length,
                  itemBuilder: (context, index) {
                    return RPadding(
                      padding: REdgeInsets.symmetric(vertical: 10.w),
                      child: Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          provider.removeItem(provider.cartList![index], index);
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
                        child: CartCard(
                          cart: provider.cartList![index],
                          numOfItems: provider.itemIndex[index],
                          onAddPressed: () {
                            ref
                                .read(cartProvider)
                                .inc(provider.itemIndex[index]);

                            // ref
                            //     .read(cartProvider)
                            //     .addToCart(provider.cartList![index]);
                          },
                          onRemovePressed: () {
                            ref
                                .read(cartProvider)
                                .removeItem(provider.cartList![index], index);
                          },
                        ),
                      ),
                    );
                  })
              : const Center(
                  child: Text("Cart is Empty"),
                );
        },
      ),
    );
  }
}
