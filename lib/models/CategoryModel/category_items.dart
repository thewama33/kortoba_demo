import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../presentation/components/animation/parallax_delegate.dart';
import 'category_model.dart';

class CategoryListItem extends StatelessWidget {
  CategoryListItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.id,
  });

  final String? imageUrl;
  final String? name;
  final String? id;
  final GlobalKey _backgroundImageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: REdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: AspectRatio(
        aspectRatio: 8 / 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Stack(
            children: [
              _buildParallaxBackground(context),
              _buildGradient(),
              _buildTitleAndSubtitle(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return Flow(
      delegate: ParallaxFlowDelegate(
        scrollable: Scrollable.of(context)!,
        listItemContext: context,
        backgroundImageKey: _backgroundImageKey,
      ),
      children: [
        CachedNetworkImage(
          imageUrl: imageUrl!,
          height: 250.h,
          key: _backgroundImageKey,
          fit: BoxFit.cover,
        )
      ],
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.3, 0.95],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndSubtitle() {
    return Center(
      child: Text(
        name!,
        style: TextStyle(
          color: Colors.white,
          fontSize: 28.sp,
          fontFamily: 'Tajawal',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

List<Results> categList = [
  Results(
      id: 1,
      name: "طعام",
      imageLink:
          "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/assortment-of-colorful-ripe-tropical-fruits-top-royalty-free-image-995518546-1564092355.jpg"),
  Results(
      id: 2,
      name: "ملابس",
      imageLink:
          "https://assets.weforum.org/article/image/responsive_big_webp_YlqprZMVrDcJUXbdjc5rAP6uqoO_YT1xZNby3HjH_KM.webp"),
  Results(
      id: 3,
      name: "هواتف محموله",
      imageLink:
          "https://www.91-cdn.com/hub/wp-content/uploads/2021/12/moto-edge-x30-specs-feat-2-696x365.jpg"),
  Results(
      id: 4,
      name: "اجهزه كهربائيه",
      imageLink:
          "https://cyclingmagazine.ca/wp-content/uploads/2021/01/zwift_devices-1200x675.jpg"),
  Results(
      id: 5,
      name: "فواكه",
      imageLink:
          "https://khodaryonline.com//storage/category/3/N2Ahhm734tcoictpFcGeiQlmkwo62V5BGzKsgmfo.jpg"),
];
