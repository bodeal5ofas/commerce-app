import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/feature/auth/login/data/models/login_request.dart';
import 'package:ecommerce_app/feature/auth/login/data/models/login_response/login_response.dart';
import 'package:ecommerce_app/feature/auth/register/data/models/register_request_model.dart';
import 'package:ecommerce_app/feature/auth/register/data/models/register_response_sucess_model/register_response_sucess_model.dart';

class ApiService {
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
}
