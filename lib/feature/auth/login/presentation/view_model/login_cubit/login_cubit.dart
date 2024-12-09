import 'package:bloc/bloc.dart';
//import 'package:dartz/dartz.dart';
//import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/feature/auth/login/data/models/login_response/login_response.dart';
import 'package:ecommerce_app/feature/auth/login/data/repos/login_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitialState());
  LoginRepo loginRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState());
      var result = await loginRepo.login(
          email: emailController.text, password: passwordController.text);
      result.fold(
        (error) {
          emit(LoginFailureState(errMessage: error.errorMessage));
        },
        (response) {
          emit(LoginSuccessState(loginResponse: response));
        },
      );
    }
  }
}
