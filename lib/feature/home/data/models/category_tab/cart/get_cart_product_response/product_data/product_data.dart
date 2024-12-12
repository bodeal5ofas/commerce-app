import 'package:equatable/equatable.dart';

import 'product.dart';

class ProductData extends Equatable {
  final int? count;
  final String? id;
  final Product? productData;
  final int? price;

  const ProductData({this.count, this.id, this.productData, this.price});

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        count: json['count'] as int?,
        id: json['_id'] as String?,
        productData: json['product'] == null
            ? null
            : Product.fromJson(json['product'] as Map<String, dynamic>),
        price: json['price'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'count': count,
        '_id': id,
        'product': productData?.toJson(),
        'price': price,
      };

  @override
  List<Object?> get props => [count, id, productData, price];
}
