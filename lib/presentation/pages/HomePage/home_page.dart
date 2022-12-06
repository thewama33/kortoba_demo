import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_demo/core/colors.dart';
import '../../components/base/appBar.dart';
import 'widgets/category_list.dart';
import 'widgets/category_title.dart';
import 'widgets/feed_news.dart';
import 'widgets/popular_list.dart';
import 'widgets/search_bar.dart';

class HomePage extends StatefulWidget {
  // const HomeScreen({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int bottomNavBarSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          backgroundColor: kScafforlBackground,
          expandedHeight: 150.h,
          flexibleSpace: FlexibleSpaceBar(
            background: Column(
              children: <Widget>[
                baseAppBar(),
               const SizedBox(
                  height: 20,
                ),
                SearchBar()
              ],
            ),
          ),
          stretch: true,
        ),

        const SliverToBoxAdapter(
          child: SizedBox(height: 20),
        ),
        const FeedNews(),
        const SliverToBoxAdapter(
          child: SizedBox(height: 15),
        ),
        const CategoryTitle(title: 'التصنيفات', trailingTitle: 'شاهد الكل'),
        const HomeCategoryList(),
        const CategoryTitle(title: 'الاكثر شعبيه', trailingTitle: 'شاهد الكل'),
        const HomePopularList()
        // HomePopularList(),
      ],
    ));
  }
}
