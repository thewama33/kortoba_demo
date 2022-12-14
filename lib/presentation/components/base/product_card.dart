import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_demo/core/extentions.dart';
import 'package:kortoba_demo/models/ProductsModel/products_model.dart';

import '../../../core/colors.dart';
import '../../../providers/FavoriteProvider/favorite_provider.dart';
import '../../pages/DetailedPage/detailed_page.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.2,
    required this.product,
    required this.index,
  }) : super(key: key);

  final double width, aspectRetio;
  int index;
  final ProductsResults product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: SizedBox(
        width: width.w,
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => DetailsScreen(
                index: index,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: aspectRetio,
                child: Container(
                  padding: REdgeInsets.all(20.r),
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: product.id.toString(),
                    child: CachedNetworkImage(
                      imageUrl: product.imageLink!,
                      width: 20.w,
                      height: 40.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.name!.capitalize(),
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "L.E ${product.price}",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  Consumer(
                    builder: (ctxt, ref, child) {
                      final provider = ref.watch(favoriteProvider);
                      return InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                          if (!provider.isFavoriterd(product)) {
                            ref.read(favoriteProvider).addToFavorite(product);
                          } else {
                            ref.read(favoriteProvider).removeItem(product);
                          }
                        },
                        child: Container(
                          padding: REdgeInsets.all(8.r),
                          height: 28.h,
                          width: 28.w,
                          decoration: BoxDecoration(
                            color: provider.isFavoriterd(product)
                                ? kPrimaryColor.withOpacity(0.15)
                                : kSecondaryColor.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(Icons.favorite_rounded,
                                size: 14,
                                color: provider.isFavoriterd(product)
                                    ? Color(0xFFFF4848)
                                    : Colors.grey),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
