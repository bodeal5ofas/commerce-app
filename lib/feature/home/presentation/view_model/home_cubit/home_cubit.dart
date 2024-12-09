import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/feature/home/presentation/view/account_view.dart';
import 'package:ecommerce_app/feature/home/presentation/view/category_view.dart';
import 'package:ecommerce_app/feature/home/presentation/view/favoritue_view.dart';
import 'package:ecommerce_app/feature/home/presentation/view/home_tap_body.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());
  int currentIndex = 0;
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
}
