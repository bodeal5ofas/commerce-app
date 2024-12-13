import 'package:ecommerce_app/core/utils/custom_show_snack_bar.dart';
import 'package:ecommerce_app/core/utils/mytheme.dart';
import 'package:ecommerce_app/feature/home/presentation/view_model/category_cubit/category_cubit.dart';
import 'package:ecommerce_app/feature/home/presentation/view_model/favoritue_cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteIconWidget extends StatelessWidget {
  const FavoriteIconWidget({
    super.key,
    required this.productId,
  });
  final String productId;

  Widget build(BuildContext context) {
    var provider = BlocProvider.of<FavoriteCubit>(context);
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        return CircleAvatar(
          backgroundColor: Colors.white,
          radius: 15,
          child: IconButton(
              onPressed: () {
                provider.isFavorite == false
                    ? provider.addProductsFavorite(productId: productId)
                    : provider.deleteProductsFavorite(productId: productId);
              },
              icon: provider.isFavorite == false
                  ? Icon(
                      Icons.favorite_border,
                      color: Mytheme.mainColor,
                    )
                  : const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )),
        );
      },
    );
  }
}
