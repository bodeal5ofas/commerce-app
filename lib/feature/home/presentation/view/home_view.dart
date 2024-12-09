//import 'package:ecommerce_app/feature/home/presentation/view/account_view.dart';
//import 'package:ecommerce_app/feature/home/presentation/view/category_view.dart';
//import 'package:ecommerce_app/feature/home/presentation/view/favoritue_view.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/custom_bottom_navigation_bar.dart';
//import 'package:ecommerce_app/feature/home/presentation/view/widgets/home_view_body.dart';
import 'package:ecommerce_app/feature/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeCubit provider;
  @override
  void initState() {
    provider = BlocProvider.of<HomeCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    provider = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(child: provider.bodies[provider.currentIndex]),
          bottomNavigationBar: CustomBottomNavigationBar(
            currentIndex: provider.currentIndex,
            onTap: (p0) {
              provider.changeCurrentIndex(p0);
            },
          ),
        );
      },
    );
  }
}
