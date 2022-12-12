import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_demo/models/ProductsModel/products_model.dart';


class ProductImages extends StatefulWidget {
  const ProductImages({
    Key? key,
    required this.results,
  }) : super(key: key);

  final Results results;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 238.w,
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.results.id.toString(),
              child: CachedNetworkImage(imageUrl: widget.results.imageLink!),
            ),
          ),
        ),
        // SizedBox(height: getProportionateScreenWidth(20)),
      ],
    );
  }
}
