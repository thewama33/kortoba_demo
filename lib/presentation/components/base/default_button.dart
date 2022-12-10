// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/appTheme.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton(
      {Key? key,
      required this.text,
      this.width,
      this.height,
      this.color,
      this.onPressed})
      : super(key: key);

  final String? text;
  final double? width;
  final double? height;
  void Function()? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50.h,
      child: ElevatedButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: onPressed,
        child: Text(text!, style: textTheme().button),
      ),
    );
  }
}
