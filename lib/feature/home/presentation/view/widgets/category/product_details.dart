import 'package:ecommerce_app/core/utils/app_routes.dart';
import 'package:ecommerce_app/core/utils/mytheme.dart';
import 'package:ecommerce_app/feature/home/data/models/category_tab/product/datum.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/category/details_images.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/category/details_info.dart';
//import 'package:ecommerce_app/feature/home/presentation/view/widgets/category/details_price_info.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Product Details',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Mytheme.mainColor,
              )),
          IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRoutes.kCartView);
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Mytheme.mainColor,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailsImages(images: productModel.images ?? []),
            const SizedBox(
              height: 10,
            ),
            DetailsInfo(
              productModel: productModel,
            ),
          ],
        ),
      ),
    );
  }
}
