import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_demo/models/ProductsModel/products_model.dart';
import 'package:kortoba_demo/presentation/pages/DetailedPage/widgets/top_rounded_container.dart';

import '../../../components/base/default_button.dart';
import 'product_description.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final ProductsResults results;

  const Body({Key? key, required this.results}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(results: results),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                results: results,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 0.15.sw,
                          right: 0.15.sw,
                          bottom: 40.w,
                          top: 15.w,
                        ),
                        child: DefaultButton(
                          text: "Add To Cart",
                          height: 80.h,
                          width: 80.w,
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
