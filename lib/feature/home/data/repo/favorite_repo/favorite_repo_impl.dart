import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/feature/home/data/models/category_tab/add_to_favorite_response.dart';
import 'package:ecommerce_app/feature/home/data/models/category_tab/product/datum.dart';
import 'package:ecommerce_app/feature/home/data/repo/favorite_repo/favorite_repo.dart';

class FavoriteRepoImpl extends FavoriteRepo {
  ApiService apiService;
  FavoriteRepoImpl(this.apiService);
  @override
  Future<Either<Failure, AddToFavoriteResponse>> addProductsFavorite(
      {required String productId}) async {
    try {
      var data = await apiService.addProductFavorite(productId: productId);
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
  @override
  Future<Either<Failure, AddToFavoriteResponse>> deleteProductsFavorite(
      {required String productId}) async {
    try {
      var data = await apiService.deleteProductFavorite(productId: productId);
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getAllFavoriteProduct() async{
    try {
      var data = await apiService.getAllFavoriteProduct();
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
