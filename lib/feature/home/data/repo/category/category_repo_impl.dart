import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/feature/home/data/models/category_tab/add_to_favorite_response.dart';
import 'package:ecommerce_app/feature/home/data/models/category_tab/cart/add_product_cart_response/add_product_cart_response.dart';
import 'package:ecommerce_app/feature/home/data/models/category_tab/product/datum.dart';
import 'package:ecommerce_app/feature/home/data/repo/category/category_repo.dart';

class CategoryRepoImpl extends CategoryRepo {
  ApiService apiService;
  CategoryRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<ProductModel>>> getAllProducts() async {
    try {
      var data = await apiService.getAllProducts();
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
