import 'package:ecommerce_app/feature/home/presentation/view/widgets/favorite/favorite_body.dart';
import 'package:flutter/material.dart';

class FavoritueView extends StatelessWidget {
  const FavoritueView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: FavoriteBody(),
    );
  }
}
