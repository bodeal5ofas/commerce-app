import 'package:ecommerce_app/core/utils/mytheme.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/category/cart/cart_iteam.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/category/cart/cart_price.dart';
import 'package:ecommerce_app/feature/home/presentation/view_model/cubit/cart_cubit.dart';
import 'package:ecommerce_app/feature/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Mytheme.mainColor,
              )),
          Icon(
            Icons.shopping_cart_outlined,
            color: Mytheme.mainColor,
          ),
        ],
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is GetCartProductsSuccess) {
            return Column(
              children: [
                Expanded(
                    child: ListView.builder(
                  itemCount: state.cartProductsResponse.numOfCartItems,
                  itemBuilder: (context, index) => CartIteam(
                    product: state.cartProductsResponse.data!.products![index],
                  ),
                )),
                CartPrice(
                  price: state.cartProductsResponse.data?.totalCartPrice ?? 0,
                )
              ],
            );
          } else if (state is GetCartProductsFailure) {
            return Center(
              child: Text(state.errMessage),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
