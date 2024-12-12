import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/feature/home/data/models/category_tab/cart/get_cart_product_response/get_cart_product_response.dart';

abstract class CartRepo{
  Future<Either<Failure, GetCartProductResponse>> getCartProducts();
}