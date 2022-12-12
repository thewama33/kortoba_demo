import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kortoba_demo/core/extentions.dart';
import 'package:kortoba_demo/models/ProductsModel/products_model.dart';

import '../../../core/colors.dart';
import '../../pages/DetailedPage/detailed_page.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.2,
    required this.product,
    this.isFavorited,
  }) : super(key: key);

  final double width, aspectRetio;
  final Results product;
  final isFavorited;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: SizedBox(
        width: width.w,
        child: InkWell(
          onTap: () {
            Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => DetailsScreen(productsResponse: product)));
          },

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: aspectRetio,
                child: Container(
                  padding: REdgeInsets.all(20.r),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
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
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Container(
                      padding: REdgeInsets.all(8.r),
                      height: 28.h,
                      width: 28.w,
                      decoration: BoxDecoration(
                        color: isFavorited
                            ? kPrimaryColor.withOpacity(0.15)
                            : kSecondaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/heart_icon1.svg",
                        color:
                            isFavorited ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
                      ),
                    ),
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
