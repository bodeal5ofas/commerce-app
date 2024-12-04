import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/feature/auth/register/data/models/register_response_sucess_model/register_response_sucess_model.dart';

abstract class RegisterRepo {
  Future<Either<Failure, RegisterResponseSucessModel>> register({
    required String name,
    required String email,
    required String password,
    required String repassword,
    required String phone,
  });
}
