import 'package:equatable/equatable.dart';

import 'product.dart';

class Data extends Equatable {
  final String? id;
  final String? cartOwner;
  final List<Product>? products;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final int? totalCartPrice;

  const Data({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['_id'] as String?,
        cartOwner: json['cartOwner'] as String?,
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        totalCartPrice: json['totalCartPrice'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'cartOwner': cartOwner,
        'products': products?.map((e) => e.toJson()).toList(),
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'totalCartPrice': totalCartPrice,
      };

  @override
  List<Object?> get props {
    return [
      id,
      cartOwner,
      products,
      createdAt,
      updatedAt,
      v,
      totalCartPrice,
    ];
  }
}
