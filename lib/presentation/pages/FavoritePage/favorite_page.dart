
import 'package:flutter/material.dart';
import 'package:kortoba_demo/presentation/pages/FavoritePage/widgets/favorite_body.dart';


class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: FavoriteBody()
    );
  }
}