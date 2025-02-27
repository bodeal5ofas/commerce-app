import 'package:ecommerce_app/core/utils/custom_show_snack_bar.dart';
import 'package:ecommerce_app/core/utils/mytheme.dart';
import 'package:ecommerce_app/core/utils/shared_prefrence_utils.dart';
import 'package:ecommerce_app/core/utils/stripe_service.dart';
import 'package:ecommerce_app/feature/home/data/models/payment_stripe/payment_input_model.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/category/cart/payment_method.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/category/cart/payment_methods_card.dart';
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
              onPressed: () {
                showBottomSheet(
                    context: context,
                    builder: (context) => PaymentMethodsCard(
                          price: price,
                        ));
              },
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
