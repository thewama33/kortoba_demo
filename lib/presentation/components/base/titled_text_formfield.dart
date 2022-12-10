// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_demo/core/colors.dart';

class InputFieldWidget extends StatelessWidget {
  final bool obscure;
  final double? height;
  final double width;
  final int lines;
  final Widget? suffix;
  final Widget? prefix;
  final String? hinttext;
  final String? labeltext;
  final String? initialvalue;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final TextStyle? hintstyle;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final TextAlign? textAlign;
  final bool? validation;
  final String? validationText;
  void Function(String)? onChanged;

  void Function()? onChangedCompleted;
  dynamic disable;
  bool? isDisable = true;

  InputFieldWidget({
    Key? key,
    required this.obscure,
    required this.height,
    required this.width,
    required this.lines,
    required this.controller,
    this.suffix,
    this.keyboardType,
    this.initialvalue,
    this.hinttext,
    this.labeltext,
    this.hintstyle,
    this.labelStyle,
    this.style,
    this.textAlign,
    this.validation,
    this.validationText,
    this.onChanged,
    this.onChangedCompleted,
    this.prefix,
    this.disable,
    this.isDisable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
       
     autovalidateMode: AutovalidateMode.onUserInteraction,
        onEditingComplete: onChangedCompleted,
        onChanged: onChanged,
        autocorrect: true,
        // onEditingComplete: onchanged,
        controller: controller,
        maxLines: lines,
        enabled: isDisable,
        // textDirection: TextDirection.rtl,
        obscureText: obscure,
        keyboardType: keyboardType,
        style: style ??
            TextStyle(
                color: kTextColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'Tajawal'),
        validator: (value) {
          if (validation == false && validation != null) {
            return validationText;
          } else if (value!.isEmpty) {
            return validationText;
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: hinttext,
          labelText: labeltext,
          prefixIcon: suffix,
          suffixIcon: prefix,
          filled: true,
        ),
      ),
    );
  }
}
