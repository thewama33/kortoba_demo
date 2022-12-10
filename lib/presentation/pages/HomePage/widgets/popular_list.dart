import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_demo/providers/home_provider.dart';

class HomePopularList extends ConsumerWidget {
  const HomePopularList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var provider = ref.read(productsProvider);
    return SliverToBoxAdapter(
        child: provider.whenOrNull(
      data: (data) => ListView(
        shrinkWrap: true,
        addAutomaticKeepAlives: true,
        physics: const NeverScrollableScrollPhysics(),
        //scrollDirection: Axis.horizontal,
        children: [
          ...List.generate(
              data?.results?.length ?? 0,
              (i) => Card(
                    child: Container(
                      width: 100.w,
                      height: 350.h,
                      child: Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl: data!.results![i].imageLink!,
                            height: 200,
                            fit: BoxFit.contain,
                          ),
                          ListTile(
                            title: Text(
                              data.results![i].name!,
                            ),
                            subtitle: Text(
                              data.results![i].description!,
                              overflow: TextOverflow.ellipsis,
                            ),
                            leading: CircleAvatar(
                                child: Text(data.results![i].rate!)),
                            trailing: Text(data.results![i].price!),
                          ),
                          20.verticalSpace
                        ],
                      ),
                    ),
                  ))
        ],
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
