import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItemsData extends StatelessWidget {
  CategoryItemsData({super.key, required this.id});

  int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container()
        //     child: Center(
        //         child: Column(
        //       children: [
        //         CachedNetworkImage(
        //           imageUrl: data.imageLink!,
        //           height: 250.h,
        //           fit: BoxFit.cover,
        //         ),
        //         ListTile(
        //           title: Text(data.name!),
        //           subtitle: Text(data.description!),
        //           leading: Text("${data.id}"),
        //           trailing: Text("${data.price}"),
        //         )
        //       ],
        //     )
        // )),
        );
  }
}
