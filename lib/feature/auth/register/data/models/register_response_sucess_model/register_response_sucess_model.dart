import 'package:ecommerce_app/feature/auth/register/data/models/register_response_fail_model.dart';
import 'package:equatable/equatable.dart';

import 'user.dart';

class RegisterResponseSucessModel extends Equatable {
  final String? message;
  final User? user;
  final String? token;
  final RegisterResponseFailModel? error;

  const RegisterResponseSucessModel({this.message, this.user, this.token,this.error});

  factory RegisterResponseSucessModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseSucessModel(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
     error:json['errors'] !=null? RegisterResponseFailModel.fromJson(json['errors']):null ,   
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'user': user?.toJson(),
        'token': token,
      };

  @override
  List<Object?> get props => [message, user, token];
}
