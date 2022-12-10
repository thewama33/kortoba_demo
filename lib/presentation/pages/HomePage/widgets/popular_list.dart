import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_demo/core/colors.dart';
import 'package:kortoba_demo/presentation/components/base/item_card.dart';
import 'package:kortoba_demo/providers/home_provider.dart';

class HomePopularList extends ConsumerWidget {
  const HomePopularList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var provider = ref.read(productsProvider);
    return SliverToBoxAdapter(
        child: provider.whenOrNull(
      data: (data) => SocialPictureGroup(
        width: 100.w,
        color: kPrimaryColor,
        onTap: () {},
        imgUrl: data!.results![0].imageLink!,
        title: data.results![0].name!,
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Text(error.toString()),
    ));
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()..moveTo(0, 0);

    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(0, size.height, 20, size.height);

    path.lineTo(size.width - 20, size.height - 20);
    path.quadraticBezierTo(
        size.width, size.height - 25, size.width, size.height - 50);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
