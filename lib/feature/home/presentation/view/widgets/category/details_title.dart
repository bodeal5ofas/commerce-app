import 'package:ecommerce_app/feature/home/data/models/category_tab/product/datum.dart';
import 'package:flutter/material.dart';

class DetailtsTitle extends StatelessWidget {
  const DetailtsTitle({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Text(
            productModel.title ?? '',
            style:
                Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 22),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 2,
          child: Text(
            'EGP ${productModel.price}',
            style:
                Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 22),
          ),
        )
      ],
    );
  }
}
