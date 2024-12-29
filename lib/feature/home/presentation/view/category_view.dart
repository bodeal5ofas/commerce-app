import 'package:ecommerce_app/core/service_locater.dart';
import 'package:ecommerce_app/feature/home/data/repo/category/category_repo.dart';
//import 'package:ecommerce_app/feature/home/data/repo/category/category_repo_impl.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/category/product_grid_view.dart';
//import 'package:ecommerce_app/feature/home/presentation/view/widgets/category/product_iteam.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/custom_logo.dart';
import 'package:ecommerce_app/feature/home/presentation/view_model/category_cubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
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
          BlocProvider(
            create: (context) =>
                CategoryCubit(getIt.get<CategoryRepo>())..getAllProducts(),
            child: const Expanded(child: ProductGridView()),
          )
        ],
      ),
    );
  }
}
