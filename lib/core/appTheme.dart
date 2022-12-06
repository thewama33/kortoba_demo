import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: kScafforlBackground,
      fontFamily: 'Tajawal',
      appBarTheme: appBarTheme(),
      iconTheme: iconTheme(),
      bottomNavigationBarTheme: bottomNavigationBarTheme(),

      // primaryColor: kPrimaryColor,
      bannerTheme:
          const MaterialBannerThemeData(backgroundColor: kPrimaryColor),
      textTheme: textTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      elevatedButtonTheme: elevatedButtonTheme(),
      outlinedButtonTheme: outlinedButtonThemeData(),
      drawerTheme: drawerThemeData(),
      checkboxTheme: checkBoxThemeData());
}

BottomNavigationBarThemeData bottomNavigationBarTheme() {
  return BottomNavigationBarThemeData(
        backgroundColor: kSecondaryColor,
        selectedIconTheme: iconTheme(),
        unselectedIconTheme: iconTheme(),
        selectedItemColor: kSecondaryColor);
}

IconThemeData iconTheme() =>
    const IconThemeData(color: kPrimaryColor, size: 32);

CheckboxThemeData checkBoxThemeData() {
  return CheckboxThemeData(
    //checkColor: MaterialStateProperty.all(kPrimaryColor),
    splashRadius: 30.r,
    fillColor: MaterialStateProperty.all(kPrimaryColor),
    checkColor: MaterialStateProperty.all(kPrimaryColor),

    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
  );
}

DrawerThemeData drawerThemeData() {
  return const DrawerThemeData(
      elevation: 2,
      backgroundColor: kPrimaryColor,
      //width: 0.7.sw,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12))));
}

OutlinedButtonThemeData outlinedButtonThemeData() {
  return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
        side: const BorderSide(color: kPrimaryColor)),
    elevation: 0,
    textStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        fontFamily: "Tajawal"),
  ));
}

ElevatedButtonThemeData elevatedButtonTheme() {
  return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    primary: kPrimaryColor,
    elevation: 0,
    textStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        fontFamily: "Tajawal"),
  ));
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.r),
    borderSide: const BorderSide(color: kPrimaryColor),
  );
  return InputDecorationTheme(
    labelStyle:
        TextStyle(color: kTextColor, fontSize: 16, fontFamily: "Tajawal"),
    fillColor: Colors.white,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: REdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
    errorStyle: TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
        fontSize: 14.sp,
        fontFamily: "Tajawal"),
    border: outlineInputBorder,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
          color: kPrimaryColor, width: 2.sp.w, style: BorderStyle.solid),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
          style: BorderStyle.solid, color: kPrimaryColor, width: 2.sp),
      borderRadius: BorderRadius.circular(12),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
          style: BorderStyle.solid, color: kPrimaryColor, width: 2.sp),
      borderRadius: BorderRadius.circular(12),
    ),
    errorBorder: OutlineInputBorder(
      borderSide:
          BorderSide(style: BorderStyle.solid, color: kErrorColor, width: 2.sp),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide:
          BorderSide(style: BorderStyle.solid, color: kErrorColor, width: 2.sp),
      borderRadius: BorderRadius.circular(12),
    ),
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kTextColor, fontFamily: 'Tajawal'),
    headline1: TextStyle(
        color: kSecondaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 22.sp,
        fontFamily: 'Tajawal'),
    headline2: TextStyle(
        color: Colors.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        fontFamily: 'Tajawal'),
    headline3:
        TextStyle(color: kTextColor, fontSize: 14.sp, fontFamily: 'Tajawal'),
    subtitle1:
        TextStyle(color: kTextColor, fontSize: 20.sp, fontFamily: "Tajawal"),
    button: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.black),
    toolbarTextStyle: TextStyle(color: kPrimaryColor, fontSize: 18.sp),
  );
}

TextStyle formFieldStyle() {
  return TextStyle(fontSize: 14.0.sp, fontWeight: FontWeight.bold);
}
