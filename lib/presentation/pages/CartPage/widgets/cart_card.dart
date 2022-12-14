// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:kortoba_demo/core/extentions.dart';
import 'package:kortoba_demo/models/ProductsModel/products_model.dart';
import 'package:kortoba_demo/providers/CartProvider/cart_provider.dart';

import '../../../../core/colors.dart';

class CartCard extends ConsumerWidget {
  

  final ProductsResults cart;
  final  numOfItems;
  final void Function()? onAddPressed;
 final void Function()? onRemovePressed;
  
  CartCard({
    required this.cart,
    required this.numOfItems,
    this.onAddPressed,
    this.onRemovePressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(cartProvider);
    return Container(
      padding: REdgeInsets.all(8.r),
      decoration: BoxDecoration(
          border: Border.all(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(12.r)),
      child: Row(
        children: [
          SizedBox(
            width: 100.w,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: CachedNetworkImage(imageUrl: cart.imageLink!),
              ),
            ),
          ),
          20.horizontalSpace,
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              cart.name!,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: "Tajawal",
                  fontWeight: FontWeight.bold),
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            Text(
              "${cart.price!.capitalize()} ج.م",
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: kPrimaryColor),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  10.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: kPrimaryColor, width: 2),
                            shape: BoxShape.circle),
                        child: CircleAvatar(
                          radius: 18.r,
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed:onRemovePressed,
                              icon: const Icon(
                                Icons.remove,
                                size: 14,
                              )),
                        ),
                      ),
                      15.horizontalSpace,
                      Container(
                          margin: const EdgeInsets.only(left: 6, right: 6),
                          child: Text(
                            '$numOfItems',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                      15.horizontalSpace,
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: kPrimaryColor, width: 2),
                            shape: BoxShape.circle),
                        child: CircleAvatar(
                          radius: 18.r,
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed: onAddPressed,
                              icon: const Icon(
                                Icons.add,
                                color: kPrimaryColor,
                                size: 14,
                              )),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ])
        ],
      ),
    );
  }
}
