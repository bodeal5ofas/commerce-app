import 'package:bloc/bloc.dart';
//import 'package:ecommerce_app/feature/home/data/models/category_tab/add_to_favorite_response.dart';
//import 'package:ecommerce_app/feature/home/data/models/category_tab/cart/add_product_cart_response/add_product_cart_response.dart';
import 'package:ecommerce_app/feature/home/data/models/category_tab/product/datum.dart';
import 'package:ecommerce_app/feature/home/data/repo/category/category_repo.dart';
import 'package:equatable/equatable.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.categoryRepo) : super(CategoryTapInitial());
  CategoryRepo categoryRepo;

  getAllProducts() async {
    emit(CategoryTapLoading());
    var result = await categoryRepo.getAllProducts();
    result.fold(
      (error) {
        emit(CategoryTapFailure(errMessage: error.errorMessage));
      },
      (products) {
        emit(CategoryTapSuccess(productsList: products));
      },
    );
  }
}
