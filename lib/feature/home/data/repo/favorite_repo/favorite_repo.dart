import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/feature/home/data/models/category_tab/add_to_favorite_response.dart';
import 'package:ecommerce_app/feature/home/data/models/category_tab/product/datum.dart';

abstract class FavoriteRepo {
  Future<Either<Failure, AddToFavoriteResponse>> addProductsFavorite(
      {required String productId});
  Future<Either<Failure, AddToFavoriteResponse>> deleteProductsFavorite(
      {required String productId});
  Future<Either<Failure, List<ProductModel>>> getAllFavoriteProduct();
}
