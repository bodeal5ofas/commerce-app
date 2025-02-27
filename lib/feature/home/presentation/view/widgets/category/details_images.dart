import 'package:ecommerce_app/core/service_locater.dart';
import 'package:ecommerce_app/core/utils/mytheme.dart';
import 'package:ecommerce_app/feature/home/data/models/category_tab/product/datum.dart';
import 'package:ecommerce_app/feature/home/data/repo/favorite_repo/favorite_repo.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/favoritue_icon_widget.dart';
import 'package:ecommerce_app/feature/home/presentation/view_model/favoritue_cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class DetailsImages extends StatelessWidget {
  const DetailsImages({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Mytheme.mainColor),
        //  borderRadius: BorderRadius.circular(40),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          ClipRRect(
            //  borderRadius: BorderRadius.circular(40),
            child: ImageSlideshow(
              //width: double.infinity,

              height: 200,
              initialPage: 0,
              indicatorColor: Mytheme.mainColor,
              indicatorBackgroundColor: Colors.white,
              // onPageChanged: (value) {
              //   print('Page changed: $value');
              // },
              autoPlayInterval: 3000,
              isLoop: false,

              children: productModel.images!.map(
                (urlImage) {
                  return Image.network(
                    urlImage,
                    fit: BoxFit.fill,
                  );
                },
              ).toList(),
            ),
          ),
          BlocProvider(
            create: (context) => FavoriteCubit(getIt.get<FavoriteRepo>()),
            child: FavoriteIconWidget(
              productId: productModel.id ?? '',
            ),
          )
          // FavoriteIconWidget(productId: '',),
        ],
      ),
    );
  }
}
