import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/shared_prefrence_utils.dart';
import 'package:ecommerce_app/feature/auth/login/data/models/login_request.dart';
import 'package:ecommerce_app/feature/auth/login/data/models/login_response/login_response.dart';
import 'package:ecommerce_app/feature/auth/register/data/models/register_request_model.dart';
import 'package:ecommerce_app/feature/auth/register/data/models/register_response_sucess_model/register_response_sucess_model.dart';
import 'package:ecommerce_app/feature/home/data/models/category_tab/add_to_favorite_response.dart';
import 'package:ecommerce_app/feature/home/data/models/category_tab/cart/add_product_cart_response/add_product_cart_response.dart';
import 'package:ecommerce_app/feature/home/data/models/category_tab/cart/get_cart_product_response/get_cart_product_response.dart';
import 'package:ecommerce_app/feature/home/data/models/category_tab/product/datum.dart';
import 'package:ecommerce_app/feature/home/data/models/home_tape/category_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  // base url https://ecommerce.routemisr.com
  ApiService(this._dio);
  final Dio _dio;
  Future<RegisterResponseSucessModel> register({
    required String name,
    required String email,
    required String password,
    required String repassword,
    required String phone,
  }) async {
    var regsterRequesy = RegisterRequestModel(
      email: email,
      name: name,
      password: password,
      phone: phone,
      rePassword: repassword,
    );
    Response response = await _dio.post(
        'https://ecommerce.routemisr.com/api/v1/auth/signup',
        data: regsterRequesy.toJson());
    log(response.toString());
    SharedPrefrenceUtils.set(key: 'name', value: name);
    SharedPrefrenceUtils.set(key: 'email', value: email);
    SharedPrefrenceUtils.set(key: 'password', value: password);
    SharedPrefrenceUtils.set(key: 'phone', value: phone);
    return RegisterResponseSucessModel.fromJson(response.data);
  }

  Future<LoginResponse> login(
      {required String email, required String password}) async {
    var loginRequest = LoginRequest(email: email, password: password);
    var response = await _dio.post(
        'https://ecommerce.routemisr.com/api/v1/auth/signin',
        data: loginRequest.toJson());
    return LoginResponse.fromJson(response.data);
  }

  Future<List<CategoryResponse>> getAllCategory() async {
    List<CategoryResponse> categoryList = [];
    var response =
        await _dio.get('https://ecommerce.routemisr.com/api/v1/categories');
    var data = response.data['data'];
    for (var element in data) {
      categoryList.add(CategoryResponse.fromJson(element));
    }
    return categoryList;
  }

  Future<List<CategoryResponse>> getAllBrands() async {
    List<CategoryResponse> categoryList = [];
    var response =
        await _dio.get('https://ecommerce.routemisr.com/api/v1/brands');
    var data = response.data['data'];
    for (var element in data) {
      categoryList.add(CategoryResponse.fromJson(element));
    }
    return categoryList;
  }

  Future<List<ProductModel>> getAllProducts() async {
    List<ProductModel> productsList = [];
    var response =
        await _dio.get('https://ecommerce.routemisr.com/api/v1/products');
    var data = response.data['data'];
    for (var element in data) {
      productsList.add(ProductModel.fromJson(element));
    }
    return productsList;
  }

  Future<AddProductCartResponse> addProductCart(
      {required String productId}) async {
    _dio.options.headers["token"] =
        SharedPrefrenceUtils.get(key: 'token').toString();
    var response = await _dio.post(
      'https://ecommerce.routemisr.com/api/v1/cart',
      data: {"productId": productId},
    );
    return AddProductCartResponse.fromJson(response.data);
  }

  Future<GetCartProductResponse> getCardProducts() async {
    _dio.options.headers["token"] =
        SharedPrefrenceUtils.get(key: 'token').toString();
    var response =
        await _dio.get('https://ecommerce.routemisr.com/api/v1/cart');
    return GetCartProductResponse.fromJson(response.data);
  }

  Future<GetCartProductResponse> updateCardProducts(
      {required String productId, required int count}) async {
    _dio.options.headers["token"] =
        SharedPrefrenceUtils.get(key: 'token').toString();
    var response = await _dio.put(
        'https://ecommerce.routemisr.com/api/v1/cart/$productId',
        data: {"count": "$count"});
    return GetCartProductResponse.fromJson(response.data);
  }

  Future<GetCartProductResponse> deleteCardProduct(
      {required String productId}) async {
    _dio.options.headers["token"] =
        SharedPrefrenceUtils.get(key: 'token').toString();
    var response = await _dio
        .delete('https://ecommerce.routemisr.com/api/v1/cart/$productId');
    return GetCartProductResponse.fromJson(response.data);
  }

  Future<AddToFavoriteResponse> addProductFavorite(
      {required String productId}) async {
    _dio.options.headers["token"] =
        SharedPrefrenceUtils.get(key: 'token').toString();
    var response = await _dio.post(
      'https://ecommerce.routemisr.com/api/v1/wishlist',
      data: {"productId": productId},
    );
    return AddToFavoriteResponse.fromJson(response.data);
  }

  Future<AddToFavoriteResponse> deleteProductFavorite(
      {required String productId}) async {
    _dio.options.headers["token"] =
        SharedPrefrenceUtils.get(key: 'token').toString();
    var response = await _dio.delete(
      'https://ecommerce.routemisr.com/api/v1/wishlist/$productId',
      data: {"productId": productId},
    );
    return AddToFavoriteResponse.fromJson(response.data);
  }

  Future<List<ProductModel>> getAllFavoriteProduct() async {
    List<ProductModel> products = [];
    _dio.options.headers["token"] =
        SharedPrefrenceUtils.get(key: 'token').toString();
    var response = await _dio.get(
      'https://ecommerce.routemisr.com/api/v1/wishlist',
    );
    var list = response.data["data"];
    for (var element in list) {
      products.add(ProductModel.fromJson(element));
    }
    return products;
  }
}
