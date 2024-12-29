import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/feature/home/data/models/category_tab/cart/add_product_cart_response/add_product_cart_response.dart';
//import 'package:ecommerce_app/feature/home/data/models/category_tab/cart/get_cart_product_response/get_cart_product_response.dart';
import 'package:ecommerce_app/feature/home/data/repo/app/app_repo.dart';
import 'package:ecommerce_app/feature/home/presentation/view/account_view.dart';
import 'package:ecommerce_app/feature/home/presentation/view/category_view.dart';
import 'package:ecommerce_app/feature/home/presentation/view/favoritue_view.dart';
import 'package:ecommerce_app/feature/home/presentation/view/home_tap_body.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.appRepo) : super(HomeInitialState());
  AppRepo appRepo;
  int currentIndex = 0;
  int numberOfcard = 0;
  List<Widget> bodies = const [
    HomeTapBody(),
    CategoryView(),
    FavoritueView(),
    AccountView()
  ];
  void changeCurrentIndex(int index) {
    emit(HomeInitialState());
    currentIndex = index;
    emit(HomeChangeTapeState());
  }

  addProductToCart({required String productId}) async {
    emit(AddtoCartLoading());

    var result = await appRepo.addProductCart(productId: productId);
    result.fold(
      (error) {
        emit(AddtoCartFailure(errMessage: error.errorMessage));
      },
      (product) {
        numberOfcard = product.numOfCartItems ?? 0;
        log(numberOfcard.toString());
        emit(AddtoCartSuccess(productCartResponse: product));
      },
    );
  }
}
