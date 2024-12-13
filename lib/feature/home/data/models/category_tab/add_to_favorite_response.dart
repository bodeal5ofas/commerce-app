import 'package:equatable/equatable.dart';

class AddToFavoriteResponse extends Equatable {
  final String? status;
  final String? message;
  final List<dynamic>? data;

  const AddToFavoriteResponse({this.status, this.message, this.data});

  factory AddToFavoriteResponse.fromJson(Map<String, dynamic> json) {
    return AddToFavoriteResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data,
      };

  @override
  List<Object?> get props => [status, message, data];
}
