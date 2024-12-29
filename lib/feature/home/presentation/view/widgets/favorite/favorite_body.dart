import 'package:ecommerce_app/feature/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/custom_logo.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/favorite/favorite_iteam.dart';
import 'package:ecommerce_app/feature/home/presentation/view_model/favoritue_cubit/favorite_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: CustomLogo(),
        ),
        CustomAppBar(searchController: searchController),
        BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            if (state is GetAllFavoriteSuccess) {
              return Expanded(
                child: ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) => FavoriteIteam(
                    productModel: state.products[index],
                  ),
                ),
              );
            } else if (state is GetAllFavoriteFailure) {
              return Center(
                child: Text(state.errMessage),
              );
            } else {
              return const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
