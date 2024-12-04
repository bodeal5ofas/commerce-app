import 'package:ecommerce_app/feature/auth/register/data/models/error.dart';
import 'package:equatable/equatable.dart';

class RegisterResponseFailModel extends Equatable {
  final String? statusMsg;
  final String? message;
    final Error? error;

  const RegisterResponseFailModel({this.statusMsg,this.error, this.message});

  factory RegisterResponseFailModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseFailModel(
      error:json['errors'] !=null? Error.fromJson(json['errors']):null ,
      statusMsg: json['statusMsg'] as String?,
      message: json['message'] as String?,

    );
  }

  Map<String, dynamic> toJson() => {
        'statusMsg': statusMsg,
        'message': message,
      };

  @override
  List<Object?> get props => [statusMsg, message];
}
