import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/feature/home/data/models/home_tape/category_response.dart';

abstract class HomeRepo {
 Future<Either<Failure, List<CategoryResponse>>> getAllCategories();
  Future<Either<Failure, List<CategoryResponse>>> getAllBrands();
}
