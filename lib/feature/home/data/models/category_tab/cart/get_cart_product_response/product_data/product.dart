import 'package:equatable/equatable.dart';

import 'brand.dart';
import 'category.dart';
import 'subcategory.dart';

class Product extends Equatable {
  final List<Subcategory>? subcategory;
  final String? id;
  final String? title;
  final int? quantity;
  final String? imageCover;
  final Category? category;
  final Brand? brand;
  final double? ratingsAverage;

  const Product({
    this.subcategory,
    this.id,
    this.title,
    this.quantity,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        subcategory: (json['subcategory'] as List<dynamic>?)
            ?.map((e) => Subcategory.fromJson(e as Map<String, dynamic>))
            .toList(),
        id: json['_id'] as String?,
        title: json['title'] as String?,
        quantity: json['quantity'] as int?,
        imageCover: json['imageCover'] as String?,
        category: json['category'] == null
            ? null
            : Category.fromJson(json['category'] as Map<String, dynamic>),
        brand: json['brand'] == null
            ? null
            : Brand.fromJson(json['brand'] as Map<String, dynamic>),
        ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'subcategory': subcategory?.map((e) => e.toJson()).toList(),
        '_id': id,
        'title': title,
        'quantity': quantity,
        'imageCover': imageCover,
        'category': category?.toJson(),
        'brand': brand?.toJson(),
        'ratingsAverage': ratingsAverage,
        'id': id,
      };

  @override
  List<Object?> get props {
    return [
      subcategory,
      id,
      title,
      quantity,
      imageCover,
      category,
      brand,
      ratingsAverage,
      id,
    ];
  }
}
