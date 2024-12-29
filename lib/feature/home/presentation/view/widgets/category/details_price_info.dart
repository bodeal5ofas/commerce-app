import 'package:ecommerce_app/core/utils/mytheme.dart';
//import 'package:ecommerce_app/feature/home/data/models/category_tab/product/datum.dart';
import 'package:flutter/material.dart';

class DetailsPriceInfo extends StatelessWidget {
  const DetailsPriceInfo({super.key, required this.price});

  final num price;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              "Total Price",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Mytheme.mainColor.withOpacity(0.8)),
            ),
            Text(
              'EGP $price',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 22),
            ),
          ],
        ),
        const Spacer(),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15),
                backgroundColor: Mytheme.mainColor),
            onPressed: () {},
            child: Row(
              children: [
                const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'Add To Cart',
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ))
      ],
    );
  }
}
