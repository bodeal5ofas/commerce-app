import 'package:ecommerce_app/core/service_locater.dart';
import 'package:ecommerce_app/feature/home/data/repo/favorite_repo/favorite_repo.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/favorite/favorite_body.dart';
import 'package:ecommerce_app/feature/home/presentation/view_model/favoritue_cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritueView extends StatelessWidget {
  const FavoritueView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) =>
            FavoriteCubit(getIt.get<FavoriteRepo>())..getAllFavoriteProduct(),
        child: const FavoriteBody(),
      ),
    );
  }
}
