import 'package:equatable/equatable.dart';

class Error extends Equatable {
  final String? value;
  final String? msg;
  final String? param;
  final String? location;

  const Error({this.value, this.msg, this.param, this.location});

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        value: json['value'] as String?,
        msg: json['msg'] as String?,
        param: json['param'] as String?,
        location: json['location'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'value': value,
        'msg': msg,
        'param': param,
        'location': location,
      };

  @override
  List<Object?> get props => [value, msg, param, location];
}
