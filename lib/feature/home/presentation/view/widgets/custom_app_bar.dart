import 'package:ecommerce_app/core/utils/mytheme.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.searchController});
  final TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Mytheme.mainColor,
                size: 30,
              ),
              hintText: 'what do you search for?',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.shopping_cart_outlined,
            color: Mytheme.mainColor,
            size: 30,
          ),
        ),
      ],
    );
  }
}
