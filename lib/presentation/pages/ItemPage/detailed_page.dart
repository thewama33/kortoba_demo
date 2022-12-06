import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_demo/core/appTheme.dart';
import 'package:kortoba_demo/core/colors.dart';
import 'package:kortoba_demo/models/CategoryModel/category_items.dart';
import 'package:kortoba_demo/presentation/pages/CartPage/cart_page.dart';
import 'package:kortoba_demo/presentation/components/base/default_button.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with TickerProviderStateMixin {
  _ProductDetailPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 40.0,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
        title: Text("PRODUCT DETAIL", style: textTheme().headline1),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                   
                   
                    stretch: true,
                    centerTitle: true,
                    expandedHeight: 300.h,
                    backgroundColor: kScafforlBackground,
                    flexibleSpace: FlexibleSpaceBar(
                      stretchModes: [
                        StretchMode.zoomBackground,
                        //StretchMode.fadeTitle,
                        StretchMode.blurBackground
                      ],
                      background: Image.network(
                        categList[0].imageLink!,
                        height: 250.h,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Card(
                      child: RPadding(
                        padding: REdgeInsets.all(18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.share,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "مشاركه المنتج",
                                  style: textTheme().bodySmall,
                                ),
                              ],
                            ),
                            const VerticalDivider(
                              color: kTextColor,
                              thickness: 4,
                              width: 5,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.favorite,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "اضافه للمفضله",
                                  style: textTheme().bodySmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            categList[0].name!,
                            style: textTheme().headline1?.copyWith(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                          ),
                          subtitle: Text("وصف المنتج سوف يظهر في هذه الخانه"),
                        ),
                        Divider()
                      ],
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: ExpansionTile(title: Text("مواصفات المنتج")),
                  ),
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "2900.0 \$",
                          style: textTheme()
                              .displayLarge
                              ?.copyWith(fontSize: 22, color: kTextColor),
                        ),
                        quantityWidget(),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: 40.verticalSpace,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: DefaultButton(
                onPressed: () {},
                text: "Buy Now",
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget quantityWidget() {
    return Row(
      children: [
        Container(
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.remove,
              size: 25,
            ),
          ),
        ),
        RPadding(
          padding: REdgeInsets.symmetric(horizontal: 22),
          child: Text(
            "1",
            style: TextStyle(
                color: kTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 22.sp),
          ),
        ),
        Container(
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              size: 25,
            ),
          ),
        ),
      ],
    );
  }
}
