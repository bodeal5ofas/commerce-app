import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/feature/auth/register/data/models/register_response_sucess_model/register_response_sucess_model.dart';
import 'package:ecommerce_app/feature/auth/register/data/repo/register_repo.dart';

class RegisterRepoImpl extends RegisterRepo {
  ApiService apiService;
  RegisterRepoImpl(this.apiService);
  @override
  Future<Either<Failure, RegisterResponseSucessModel>> register({
    required String name,
    required String email,
    required String password,
    required String repassword,
    required String phone,
  }) async {
    try {
      var userResponse = await apiService.register(
        name: name,
        email: email,
        password: password,
        repassword: repassword,
        phone: phone,
      );
      if (userResponse.statusMsg == 'fail') {
        return left(ServerFailure(errorMessage: userResponse.message!));
      }
      return right(userResponse);
    } catch (e) {
      log(e.toString());

      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
