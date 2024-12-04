import 'package:bloc/bloc.dart';
//import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/feature/auth/register/data/models/register_response_sucess_model/register_response_sucess_model.dart';
import 'package:ecommerce_app/feature/auth/register/data/repo/register_repo.dart';
import 'package:flutter/material.dart';
//import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(RegisterInitial());
  RegisterRepo registerRepo;
  TextEditingController nameController = TextEditingController();
  TextEditingController mobilController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoadingState());
      try {
        var response = await registerRepo.register(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
          repassword: repasswordController.text,
          phone: mobilController.text,
        );

        response.fold(
          (error) {
            emit(RegisterFailureState(errMessage: error.errorMessage));
          },
          (userResponse) {
            emit(RegisterSucessfullState(responseSucessModel: userResponse));
          },
        );
      } catch (e) {
        emit(RegisterFailureState(errMessage: e.toString()));
      }
    }
  }
}
