import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/feature/home/data/models/category_tab/add_to_favorite_response.dart';
import 'package:ecommerce_app/feature/home/data/models/category_tab/product/datum.dart';
import 'package:ecommerce_app/feature/home/data/repo/favorite_repo/favorite_repo.dart';
import 'package:equatable/equatable.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.favoriteRepo) : super(FavoriteInitial());
  bool isFavorite = false;
  FavoriteRepo favoriteRepo;
  addProductsFavorite({required String productId}) async {
    // emit(AddtoFavoriteLoading());
    var result = await favoriteRepo.addProductsFavorite(productId: productId);
    result.fold(
      (error) {
        emit(AddtoFavoriteFailure(errMessage: error.errorMessage));
      },
      (response) {
        isFavorite = true;
        emit(AddtoFavoriteSuccess(response: response));
      },
    );
  }

  deleteProductsFavorite({required String productId}) async {
    // emit(AddtoFavoriteLoading());
    var result =
        await favoriteRepo.deleteProductsFavorite(productId: productId);
    result.fold(
      (error) {
        emit(DeleteFavoriteFailure(errMessage: error.errorMessage));
      },
      (response) {
        isFavorite = false;
        emit(DeleteFavoriteSuccess(response: response));
      },
    );
  }

  getAllFavoriteProduct()async{
      emit(GetAllFavoriteLoading());
    var result = await favoriteRepo.getAllFavoriteProduct();
    result.fold(
      (error) {
        emit(GetAllFavoriteFailure(errMessage: error.errorMessage));
      },
      (products) {
        
        emit(GetAllFavoriteSuccess(products: products));
      },
    );
  }
}
