//import 'package:ecommerce_app/core/utils/mytheme.dart';
import 'package:flutter/material.dart';

class CategoryRowWidgets extends StatelessWidget {
  const CategoryRowWidgets({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
        title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          'View All',
          style:
              Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 15),
        )
      ],
    );
  }
}
