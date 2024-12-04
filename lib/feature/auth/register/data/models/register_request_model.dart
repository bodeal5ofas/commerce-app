import 'package:equatable/equatable.dart';

class RegisterRequestModel extends Equatable {
  final String? name;
  final String? email;
  final String? password;
  final String? rePassword;
  final String? phone;

  const RegisterRequestModel({
    this.name,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
  });

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    return RegisterRequestModel(
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      rePassword: json['rePassword'] as String?,
      phone: json['phone'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'rePassword': rePassword,
        'phone': phone,
      };

  @override
  List<Object?> get props => [name, email, password, rePassword, phone];
}
