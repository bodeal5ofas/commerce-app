import 'package:ecommerce_app/core/utils/mytheme.dart';
import 'package:flutter/material.dart';

class FavoriteIconWidget extends StatelessWidget {
  const FavoriteIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 15,
      child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite_border,
            color: Mytheme.mainColor,
          )),
    );
  }
}