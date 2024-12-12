import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/feature/home/data/models/category_tab/cart/get_cart_product_response/get_cart_product_response.dart';
import 'package:ecommerce_app/feature/home/data/repo/cart_repo/cart_repo.dart';

class CartRepoImpl extends CartRepo {
  ApiService apiService;
  CartRepoImpl(this.apiService);
  @override
  Future<Either<Failure, GetCartProductResponse>> getCartProducts() async {
    try {
      var data = await apiService.getCardProducts();

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
