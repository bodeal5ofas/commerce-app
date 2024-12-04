part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterFailureState extends RegisterState {
  final String errMessage;

  RegisterFailureState({required this.errMessage});
}

class RegisterSucessfullState extends RegisterState {
  final RegisterResponseSucessModel responseSucessModel;

  RegisterSucessfullState({required this.responseSucessModel});
}
