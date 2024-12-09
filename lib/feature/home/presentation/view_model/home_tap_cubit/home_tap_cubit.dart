import 'package:bloc/bloc.dart';
//import 'package:dartz/dartz.dart';
//import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/feature/home/data/models/home_tape/category_response.dart';
import 'package:ecommerce_app/feature/home/data/repo/home/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeTapCubit extends Cubit<HomeTabState> {
  HomeTapCubit(this.homeRepo) : super(HomeInitialState());
  HomeRepo homeRepo;
  getAllCategories() async {
    emit(HomeCategoryLoadingState());
    var result = await homeRepo.getAllCategories();
    result.fold(
      (error) {
        emit(HomeCategoryFailureState(errMessage: error.errorMessage));
      },
      (categories) {
        emit(HomeCategorySucessState(categoryList: categories));
      },
    );
  }

   getAllBrands() async {
    emit(HomeBrandLoadingState());
    var result = await homeRepo.getAllBrands();
    result.fold(
      (error) {
        emit(HomeBrandFailureState(errMessage: error.errorMessage));
      },
      (categories) {
        emit(HomeBrandSucessState(categoryList: categories));
      },
    );
  }
}
