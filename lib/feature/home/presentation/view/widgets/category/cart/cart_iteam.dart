import 'package:ecommerce_app/core/utils/mytheme.dart';
import 'package:ecommerce_app/feature/home/data/models/category_tab/cart/add_product_cart_response/product.dart';
import 'package:ecommerce_app/feature/home/data/models/category_tab/cart/get_cart_product_response/product_data/product_data.dart';
import 'package:flutter/material.dart';

class CartIteam extends StatelessWidget {
  const CartIteam({
    super.key,
    required this.product,
  });
  final ProductData product;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.only(
        right: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Mytheme.mainColor),
        borderRadius: BorderRadius.circular(30),
      ),
      height: 100,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              product.productData?.imageCover ?? '',
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
                        product.productData?.title ?? '',
                        style: Theme.of(context).textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete,
                          size: 23,
                          color: Mytheme.mainColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'EGP ${product.price}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Mytheme.mainColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.remove_circle_outline,
                                color: Colors.white,
                              )),
                          Text(
                            product.count.toString(),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add_circle_outline_sharp,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    )
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
