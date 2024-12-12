import 'package:equatable/equatable.dart';

import 'data.dart';

class GetCartProductResponse extends Equatable {
  final String? status;
  final int? numOfCartItems;
  final String? cartId;
  final Data? data;

  const GetCartProductResponse({
    this.status,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  factory GetCartProductResponse.fromJson(Map<String, dynamic> json) {
    return GetCartProductResponse(
      status: json['status'] as String?,
      numOfCartItems: json['numOfCartItems'] as int?,
      cartId: json['cartId'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'numOfCartItems': numOfCartItems,
        'cartId': cartId,
        'data': data?.toJson(),
      };

  @override
  List<Object?> get props => [status, numOfCartItems, cartId, data];
}
