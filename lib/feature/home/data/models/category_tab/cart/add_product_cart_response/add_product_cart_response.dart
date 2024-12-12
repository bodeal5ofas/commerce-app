import 'package:equatable/equatable.dart';

import 'data.dart';

class AddProductCartResponse extends Equatable {
  final String? status;
  final String? message;
  final int? numOfCartItems;
  final String? cartId;
  final Data? data;

  const AddProductCartResponse({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  factory AddProductCartResponse.fromJson(Map<String, dynamic> json) {
    return AddProductCartResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      numOfCartItems: json['numOfCartItems'] as int?,
      cartId: json['cartId'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'numOfCartItems': numOfCartItems,
        'cartId': cartId,
        'data': data?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      status,
      message,
      numOfCartItems,
      cartId,
      data,
    ];
  }
}
