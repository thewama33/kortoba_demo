import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/colors.dart';


AnimatedContainer buildDot({int? index, int? currentPage}) {
  return AnimatedContainer(
    duration: kAnimationDuration,
    margin: REdgeInsets.only(right: 5),
    height: 6,
    width: currentPage == index ? 20.w : 6.w,
    decoration: BoxDecoration(
      color: currentPage == index ? kPrimaryColor : const Color(0xFFD8D8D8),
      borderRadius: BorderRadius.circular(3),
    ),
  );
}