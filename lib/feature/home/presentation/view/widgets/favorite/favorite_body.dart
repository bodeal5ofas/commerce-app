import 'package:ecommerce_app/feature/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/custom_logo.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/favorite/favorite_iteam.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FavoriteBody extends StatefulWidget {
  const FavoriteBody({super.key});

  @override
  State<FavoriteBody> createState() => _FavoriteBodyState();
}

class _FavoriteBodyState extends State<FavoriteBody> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomLogo(),
        CustomAppBar(searchController: searchController),
        FavoriteIteam(),
      ],
    );
  }
}
