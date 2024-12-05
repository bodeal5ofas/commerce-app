import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/feature/auth/login/data/models/login_response/login_response.dart';
import 'package:ecommerce_app/feature/auth/login/data/repos/login_repo.dart';

class LoginRepoImpl extends LoginRepo {
  ApiService apiService;
  @override
  LoginRepoImpl(this.apiService);
  Future<Either<Failure, LoginResponse>> login(
      {required String email, required String password}) async {
    try {
      var response = await apiService.login(email: email, password: password);
      if (response.statusMsg != null) {
        return Left(ServerFailure(errorMessage: response.message!));
      } else {
        return Right(response);
      }
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
