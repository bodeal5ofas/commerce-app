import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? name;
  final String? email;

  const User({
    this.name,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json['name'] as String?,
        email: json['email'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };

  @override
  List<Object?> get props => [
        name,
        email,
      ];
}
