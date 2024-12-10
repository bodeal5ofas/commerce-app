import 'package:ecommerce_app/core/utils/mytheme.dart';
import 'package:ecommerce_app/feature/home/data/models/category_tab/product/datum.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class DetailsDescription extends StatelessWidget {
  const DetailsDescription({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Description",
          style:
              Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 23),
        ),
        ReadMoreText(
          productModel.description ?? '',
          trimMode: TrimMode.Line,
          style: TextStyle(
              fontSize: 18, color: Mytheme.mainColor.withOpacity(0.7)),

          trimLines: 3,
          //colorClickableText: Mytheme.mainColor,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Show less',
          moreStyle: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.pink),
          lessStyle: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.pink),
        ),
      ],
    );
  }
}
