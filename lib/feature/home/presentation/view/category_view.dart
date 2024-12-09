import 'package:ecommerce_app/feature/home/presentation/view/widgets/category/product_iteam.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/custom_logo.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomLogo(),
            const SizedBox(
              height: 10,
            ),
            CustomAppBar(
              searchController: searchController,
            ),
            const SizedBox(
              height: 10,
            ),
            ProductIteam(),
          ],
        ),
      ),
    );
  }
}
