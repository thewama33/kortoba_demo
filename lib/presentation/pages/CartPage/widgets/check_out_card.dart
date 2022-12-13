import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_demo/core/appTheme.dart';

import '../../../../core/colors.dart';
import '../../../components/base/default_button.dart';

class CheckoutCard extends StatelessWidget {
  CheckoutCard({Key? key, required this.totalCosts}) : super(key: key);

  double totalCosts = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15.h,
        horizontal: 30.w,
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                    padding: REdgeInsets.all(10.r),
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.receipt,
                      size: 22.r,
                    )),
                const Spacer(),
                const Text(
                  "Add voucher code",
                  maxLines: 2,
                ),
                10.horizontalSpace,
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kTextColor,
                )
              ],
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "الاجمالي $totalCosts",
                      style: textTheme().headline1?.copyWith(fontSize: 18.sp),
                    ),
                    10.verticalSpace,
                    Text(
                      "الضريبة : ${(totalCosts * 0.14).ceilToDouble()}",
                      style: textTheme().headline1?.copyWith(fontSize: 18.sp),
                    ),
                  ],
                ),
                DefaultButton(
                  text: "Check Out",
                  height: 80.h,
                  width: 200.w,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
