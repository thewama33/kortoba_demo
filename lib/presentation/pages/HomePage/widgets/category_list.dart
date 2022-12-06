
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kortoba_demo/models/CategoryModel/category_items.dart';

import '../../../../core/colors.dart';
import '../../../../dummy_data.dart';

class HomeCategoryList extends StatefulWidget {
  const HomeCategoryList({Key? key}) : super(key: key);

  @override
  State<HomeCategoryList> createState() => _HomeCategoryListState();
}

class _HomeCategoryListState extends State<HomeCategoryList> {
  int currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 90,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: categoryList.length,
          itemBuilder: (ctx, i) {
            return Padding(
              padding: const EdgeInsets.only(left: 10),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    currentSelected = i;
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 70,
                      decoration: BoxDecoration(
                        color: currentSelected == i
                            ? darkGrey
                            : lightGrey,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image:  NetworkImage(
                          categList[0].imageLink!
                          ),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            currentSelected == i
                                ? Colors.black.withOpacity(.5)
                                : Colors.black.withOpacity(.85),
                            BlendMode.darken,
                          ),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        categoryList[i].icon,
                        height: 24,
                        width: 24,
                        color: currentSelected == i
                            ? Colors.white
                            : grey,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      categoryList[i].name,
                      style: TextStyle(
                        fontWeight: currentSelected == i
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
