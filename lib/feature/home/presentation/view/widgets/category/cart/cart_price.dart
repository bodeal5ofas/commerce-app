import 'package:ecommerce_app/core/utils/mytheme.dart';
import 'package:flutter/material.dart';

class CartPrice extends StatelessWidget {
  const CartPrice({super.key, required this.price});
final int price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
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
                  Text(
                    'Check Out',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
