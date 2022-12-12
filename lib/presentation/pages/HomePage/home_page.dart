import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_demo/core/colors.dart';
import 'package:kortoba_demo/presentation/pages/HomePage/widgets/flash_sale.dart';
import '../../components/base/appBar.dart';
import 'widgets/category_list.dart';
import 'widgets/category_title.dart';
import 'widgets/discount_banner.dart';
import 'widgets/feed_news.dart';
import 'widgets/popular_list.dart';
import 'widgets/search_bar.dart';
import 'widgets/top_bar.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          backgroundColor: kScafforlBackground,
          expandedHeight: 260.h,
          flexibleSpace: FlexibleSpaceBar(
            background: Column(
              children: <Widget>[
                baseAppBar(),
                const TopBar(),
                SizedBox(
                  height: 20.h,
                ),
                const SearchBar(),
              ],
            ),
          ),
          stretch: true,
        ),

        SliverToBoxAdapter(
          child: SizedBox(
            height: 20.h,
          ),
        ),

        const FeedNews(),
        const SliverToBoxAdapter(
          child: SizedBox(height: 20),
        ),
        const CategoryTitle(title: 'التصنيفات', trailingTitle: 'شاهد الكل'),
        HomeCategoryList(),

        const CategoryTitle(title: 'الاكثر شعبيه', trailingTitle: 'شاهد الكل'),
        const HomePopularList(),
         const DiscountBanner(),
        const CategoryTitle(title: 'تخفيضات', trailingTitle: 'شاهد الكل'),
        const FlashSale(),
        
       
      ],
    ));
  }
}
