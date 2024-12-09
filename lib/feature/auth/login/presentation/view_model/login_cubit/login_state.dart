part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginFailureState extends LoginState {
  final String errMessage;

  const LoginFailureState({required this.errMessage});
}

class LoginSuccessState extends LoginState {
  final LoginResponse loginResponse;

  const LoginSuccessState({required this.loginResponse});
}
