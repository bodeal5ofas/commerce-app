import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/feature/home/data/models/home_tape/category_response.dart';
import 'package:ecommerce_app/feature/home/data/repo/home/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  ApiService apiService;
  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<CategoryResponse>>> getAllCategories() async {
    try {
      var categories = await apiService.getAllCategory();
      return Right(categories);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<CategoryResponse>>> getAllBrands() async {
    try {
      var categories = await apiService.getAllBrands();
      return Right(categories);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
