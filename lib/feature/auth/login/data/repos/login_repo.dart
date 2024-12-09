import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/feature/auth/login/data/models/login_response/login_response.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginResponse>> login(
      {required String email, required String password});
}
