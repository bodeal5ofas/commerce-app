import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/feature/home/data/models/category_tab/cart/add_product_cart_response/add_product_cart_response.dart';
import 'package:ecommerce_app/feature/home/data/models/category_tab/cart/get_cart_product_response/get_cart_product_response.dart';

abstract class AppRepo {
  Future<Either<Failure, AddProductCartResponse>> addProductCart(
      {required String productId});
  
}
