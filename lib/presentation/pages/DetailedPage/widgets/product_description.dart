import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kortoba_demo/core/extentions.dart';
import 'package:kortoba_demo/models/ProductsModel/products_model.dart';

import '../../../../core/colors.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.results,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Results results;
  final GestureTapCallback? pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            results.name!.capitalize(),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(15.w),
            width: 64.w,
            decoration: BoxDecoration(
              color: results.rate!.isNotEmpty
                  ? Color(0xFFFFE6E6)
                  : Color(0xFFF5F6F9),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: SvgPicture.asset(
              "assets/icons/heart_icon2.svg",
              color: results.rate!.isNotEmpty
                  ? Color(0xFFFF4848)
                  : Color(0xFFDBDEE4),
              height: 16.h,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 64.w,
          ),
          child: Text(
            results.description!,
            maxLines: 3,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 10,
          ),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: const [
                Text(
                  "See More Detail",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
