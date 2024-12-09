import 'package:ecommerce_app/core/service_locater.dart';
import 'package:ecommerce_app/feature/home/data/repo/home/home_repo.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/home/brands_section.dart';
// 'package:ecommerce_app/feature/home/presentation/view/widgets/home/appliance_section.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/home/categories_section.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/home/category_row_widgets.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/home/custom_baner_section.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/custom_logo.dart';
import 'package:ecommerce_app/feature/home/presentation/view_model/home_tap_cubit/home_tap_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTapBody extends StatefulWidget {
  const HomeTapBody({super.key});

  @override
  State<HomeTapBody> createState() => _HomeTapBodyState();
}

class _HomeTapBodyState extends State<HomeTapBody> {
  TextEditingController searchController = TextEditingController();
  List<String> images = [
    'assets/images/baner1.png',
    'assets/images/baner2.png',
    'assets/images/baner3.png',
  ];
  @override
  Widget build(BuildContext context) {
    return
        // BlocProvider(
        //   create: (context) => HomeTapCubit(getIt.get<HomeRepo>())
        //     ..getAllCategories()
        //     ..getAllBrands(),
        //   child:
        Padding(
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
            CustomBanerSection(images: images),
            const SizedBox(
              height: 10,
            ),
            const CategoryRowWidgets(
              title: 'Categories',
            ),
            BlocProvider(
              create: (context) =>
                  HomeTapCubit(getIt.get<HomeRepo>())..getAllCategories(),
              child: const CategoriesSection(),
            ),
            const CategoryRowWidgets(
              title: 'Brands',
            ),
            BlocProvider(
              create: (context) =>
                  HomeTapCubit(getIt.get<HomeRepo>())..getAllBrands(),
              child: const BrandsSection(),
            ),
          ],
        ),
      ),
      //     ),
    );
  }
}
