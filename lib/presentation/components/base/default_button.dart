import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/appTheme.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
  }) : super(key: key);
  
  final String? text;
  void Function()? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: onPressed,
        child: Text(
          text!,
          style: textTheme().button
        ),
      ),
    );
  }
}

class OutlineDefaultButton extends StatelessWidget {
  const OutlineDefaultButton({Key? key, this.text, this.onPressed, this.color})
      : super(key: key);
  final String? text;
  final Function? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: OutlinedButton(
        style: TextButton.styleFrom(
          textStyle: formFieldStyle(),
        ),
        onPressed: onPressed as void Function()?,
        child: Text(text!, style: Theme.of(context).textTheme.headline5),
      ),
    );
  }
}
