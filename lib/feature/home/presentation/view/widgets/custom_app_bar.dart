import 'package:ecommerce_app/core/service_locater.dart';
import 'package:ecommerce_app/core/utils/app_routes.dart';
import 'package:ecommerce_app/core/utils/mytheme.dart';
import 'package:ecommerce_app/feature/home/data/repo/app/app_repo.dart';
import 'package:ecommerce_app/feature/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
              hintText: 'what do you search for? ',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Badge(
              label: Text(BlocProvider.of<HomeCubit>(context)
                  .numberOfcard
                  .toString()), //Text(blocP.numberOfcard.toString()),
              child: IconButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRoutes.kCartView);
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: Mytheme.mainColor,
                  size: 30,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
