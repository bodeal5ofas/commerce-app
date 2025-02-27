import 'package:ecommerce_app/core/utils/mytheme.dart';
import 'package:ecommerce_app/feature/home/data/models/category_tab/product/datum.dart';
import 'package:ecommerce_app/feature/home/presentation/view_model/favoritue_cubit/favorite_cubit.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteIteam extends StatelessWidget {
  const FavoriteIteam({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    var provider = BlocProvider.of<FavoriteCubit>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.only(
        right: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Mytheme.mainColor),
        borderRadius: BorderRadius.circular(30),
      ),
      height: 100,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              productModel.imageCover ?? '',
              height: 100,
              width: 100,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        productModel.title ?? '',
                        style: Theme.of(context).textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            onPressed: () {
                              provider.deleteProductsFavorite(
                                  productId: productModel.id ?? '');
                              provider.getAllFavoriteProduct();
                            },
                            icon: const Icon(
                              Icons.favorite,
                              size: 23,
                              color: Colors.red,
                            ),
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'EGP ${productModel.price}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Mytheme.mainColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          'Add to Cart',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 18),
                        ))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
