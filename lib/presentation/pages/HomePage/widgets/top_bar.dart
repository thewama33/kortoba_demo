import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/colors.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.all(8),
      decoration: BoxDecoration(
          gradient: grads, borderRadius: BorderRadius.circular(12)),
      child: RPadding(
        padding: REdgeInsets.all(25.0.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Hello Friend.",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    offset: const Offset(12, 26),
                    blurRadius: 50.r,
                    spreadRadius: 0,
                    color: Colors.grey.withOpacity(.25)),
              ]),
              child: CircleAvatar(
                radius: 25.r,
                backgroundColor: Colors.white,
                child: const Icon(
                  Icons.tiktok,
                  size: 25,
                  color: kPrimaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
