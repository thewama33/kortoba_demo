import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/appTheme.dart';

AppBar baseAppBar() {
  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.menu),
      onPressed: () {
        
      },
    ),
    actions: [
     IconButton(
      icon: Icon(Icons.search),
      onPressed: () {
        
      },
    ),
    ],
    centerTitle: true,
    title: Text(
      "التصنيفات",
      style: textTheme().titleMedium?.copyWith(fontWeight: FontWeight.bold),
    ),
  );
}
