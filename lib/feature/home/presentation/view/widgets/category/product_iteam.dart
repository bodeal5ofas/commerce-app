import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/utils/app_routes.dart';
import 'package:ecommerce_app/core/utils/mytheme.dart';
import 'package:ecommerce_app/feature/home/data/models/category_tab/product/datum.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/favoritue_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductIteam extends StatelessWidget {
  const ProductIteam({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRoutes.kDetailsView,extra: productModel);
      },
      child: Container(
        // width: 191,
        decoration: BoxDecoration(
          //   color: Colors.grey,
          border: Border.all(color: Mytheme.mainColor),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: CachedNetworkImage(
                      imageUrl: productModel.imageCover ?? '',

                      fit: BoxFit.fill,
                      height: 120,
                      width: 191,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),

                      // height: 128,
                      // width: 190,
                    ),
                  ),
                  FavoriteIconWidget()
                ],
              ),
              SizedBox(
                height: 18,
                child: Text(
                  productModel.title ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 14),
                ),
              ),
              // SizedBox(
              //   height: 18,
              //   child: Text(
              //     productModel.description ?? '',
              //     overflow: TextOverflow.ellipsis,
              //     maxLines: 1,
              //     style: Theme.of(context)
              //         .textTheme
              //         .titleMedium!
              //         .copyWith(fontSize: 14),
              //   ),
              // ),
              SizedBox(
                height: 18,
                child: Text(
                  'EGP ${productModel.price}',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 14),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Text(
                      'Review (${productModel.ratingsAverage})',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 12),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    const Spacer(),
                    CircleAvatar(
                      radius: 13,
                      backgroundColor: Mytheme.mainColor,
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


