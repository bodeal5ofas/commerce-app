import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/feature/home/data/models/category_tab/cart/add_product_cart_response/add_product_cart_response.dart';
import 'package:ecommerce_app/feature/home/data/models/category_tab/cart/get_cart_product_response/get_cart_product_response.dart';
import 'package:ecommerce_app/feature/home/data/repo/app/app_repo.dart';

class AppRepoImpl extends AppRepo {
  ApiService apiService;
  AppRepoImpl(this.apiService);

  @override
  Future<Either<Failure, AddProductCartResponse>> addProductCart(
      {required String productId}) async {
    try {
      var data = await apiService.addProductCart(productId: productId);
      if (data.status == 'fail') {
        return left(ServerFailure(errorMessage: data.message!));
      }
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
