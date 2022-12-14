// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kortoba_demo/models/ProductsModel/products_model.dart';
import 'package:kortoba_demo/providers/ProductsProvider/products_state.dart';

import '../../../providers/ProductsProvider/products_provider.dart';
import '../../components/base/form_error.dart';
import 'widgets/body_screen.dart';
import 'widgets/custom_app_bar.dart';

class DetailsScreen extends ConsumerWidget {
  static String routeName = "/details";

  final int? index;
  DetailsScreen({
    this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(homeProvider);

    if (provider is ProductsLoaded) {
      return Scaffold(
        backgroundColor: Color(0xFFF5F6F9),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: CustomAppBar(rating: double.parse(provider.itemModel!.results![index!].rate!)),
        ),
        body: Body(results: provider.itemModel!.results![index!]),
      );
    }
    if (provider is ProductsError) {
      return FormError(
        errors: [provider.message],
      );
    }
    return const Center(child: CircularProgressIndicator());
  }
}
