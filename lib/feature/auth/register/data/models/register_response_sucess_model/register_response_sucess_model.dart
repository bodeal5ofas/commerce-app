import 'package:ecommerce_app/feature/auth/register/data/models/error.dart';
import 'package:equatable/equatable.dart';

import 'user.dart';

class RegisterResponseSucessModel extends Equatable {
  final String? message;
  final User? user;
  final String? token;
  final ErrorFailure? error;
  final String? statusMsg;
  const RegisterResponseSucessModel(
      {this.message, this.user, this.token, this.statusMsg, this.error});

  factory RegisterResponseSucessModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseSucessModel(
      message: json['message'] as String?,
      statusMsg: json['statusMsg'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      error:
          json['errors'] != null ? ErrorFailure.fromJson(json['errors']) : null,
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
