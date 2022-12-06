import 'package:flutter/material.dart';
import 'package:kortoba_demo/presentation/components/base/default_button.dart';

import '../../../../core/colors.dart';

class FeedNews extends StatefulWidget {
  const FeedNews({Key? key}) : super(key: key);

  @override
  State<FeedNews> createState() => _FeedNewsState();
}

class _FeedNewsState extends State<FeedNews> {
  int currentIndex = 0;

  List<Map<String, dynamic>> list = [
    {
      "img": "assets/images/add.png",
      "type": "احذيه رياضيه",
      "discount": "30% "
    },
    {
      "img": "assets/images/cmen.png",
      "type": "هواتف محموله",
      "discount": "40% "
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          SizedBox(
            height: 180,
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              onPageChanged: (i) {
                setState(() => currentIndex = i);
              },
              itemCount: list.length,
              itemBuilder: (ctx, i) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(list[i]['img']),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(.6),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      height: 35,
                      width: 130,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        color: Colors.white24,
                      ),
                      child: const Text(
                        'عرض خاص',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                list[i]['type'],
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '${list[i]["discount"]} Discount',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              DefaultButton(
                                onPressed: () {},
                                text: "اشتري الان",
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 30,
            bottom: 10,
            child: SizedBox(
              height: 16,
              child: Row(
                children: List.generate(
                  list.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.only(right: 3),
                    height: index == currentIndex ? 16 : 8,
                    width: 5,
                    decoration: BoxDecoration(
                      color: index == currentIndex ? Colors.white : grey,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
