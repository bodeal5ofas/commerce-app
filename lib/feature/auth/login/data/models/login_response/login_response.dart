import 'package:ecommerce_app/feature/auth/register/data/models/register_response_sucess_model/user.dart';
import 'package:equatable/equatable.dart';

//import 'user.dart';

class LoginResponse extends Equatable {
  final String? message;
  final User? user;
  final String? token;
  final String? statusMsg;
  const LoginResponse({this.message, this.user, this.token,this.statusMsg});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json['message'] as String?,
        statusMsg: json['statusMsg'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'user': user?.toJson(),
        'token': token,
      };

  @override
  List<Object?> get props => [message, user, token];
}
