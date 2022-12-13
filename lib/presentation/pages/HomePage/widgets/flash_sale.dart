import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_demo/core/colors.dart';

import '../../../../providers/ProductsProvider/products_provider.dart';
import '../../../../providers/ProductsProvider/products_state.dart';
import '../../../components/base/product_card.dart';

class FlashSale extends StatelessWidget {
  const FlashSale({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: Consumer(builder: (ctxt, ref, child) {
      final state = ref.watch(homeProvider);
      if (state is ProductsLoaded) {
        return SizedBox(
          height: 230.h,
          child: ListView.builder(
            shrinkWrap: true,
            addAutomaticKeepAlives: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: state.itemModel!.results!.length > 3
                ? 3
                : state.itemModel?.results?.length,
            itemBuilder: (context, index) {
             int i =  index + 1;
              return ProductCard(
                product: state.itemModel!.results![i],
                
                aspectRetio: 1.02,
                index: i,
              );
            },
          ),
        );
      }
      if (state is ProductsLoading) {
        return const Center(
          child: CircularProgressIndicator(backgroundColor: kPrimaryColor),
        );
      }

      if (state is ProductsError) {
        return Center(
          child: Text(state.message!),
        );
      }
      return Container();
    }));
  }
}
