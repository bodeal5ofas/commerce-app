import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/feature/home/data/models/category_tab/product/datum.dart';

abstract class CategoryRepo {
  Future<Either<Failure, List<ProductModel>>> getAllProducts();
}
