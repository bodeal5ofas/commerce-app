import 'package:equatable/equatable.dart';

import 'brand.dart';
import 'category.dart';
import 'subcategory.dart';

class ProductModel extends Equatable {
  final int? sold;
  final List<dynamic>? images;
  final List<Subcategory>? subcategory;
  final int? ratingsQuantity;
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final int? quantity;
  final int? price;
  final String? imageCover;
  final Category? category;
  final Brand? brand;
  final num? ratingsAverage;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  // final String? id;
  final int? priceAfterDiscount;
  final List<dynamic>? availableColors;

  const ProductModel({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    // this.id,
    this.priceAfterDiscount,
    this.availableColors,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        sold: json['sold'] as int?,
        images: json['images'] as List<dynamic>?,
        subcategory: (json['subcategory'] as List<dynamic>?)
            ?.map((e) => Subcategory.fromJson(e as Map<String, dynamic>))
            .toList(),
        ratingsQuantity: json['ratingsQuantity'] as int?,
        id: json['_id'] as String?,
        title: json['title'] as String?,
        slug: json['slug'] as String?,
        description: json['description'] as String?,
        quantity: json['quantity'] as int?,
        price: json['price'] as int?,
        imageCover: json['imageCover'] as String?,
        category: json['category'] == null
            ? null
            : Category.fromJson(json['category'] as Map<String, dynamic>),
        brand: json['brand'] == null
            ? null
            : Brand.fromJson(json['brand'] as Map<String, dynamic>),
        ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        // id: json['id'] as String?,
        priceAfterDiscount: json['priceAfterDiscount'] as int?,
        availableColors: json['availableColors'] as List<dynamic>?,
      );

  // Map<String, dynamic> toJson() => {
  //       'sold': sold,
  //       'images': images,
  //       'subcategory': subcategory?.map((e) => e.toJson()).toList(),
  //       'ratingsQuantity': ratingsQuantity,
  //       '_id': id,
  //       'title': title,
  //       'slug': slug,
  //       'description': description,
  //       'quantity': quantity,
  //       'price': price,
  //       'imageCover': imageCover,
  //       'category': category?.toJson(),
  //       'brand': brand?.toJson(),
  //       'ratingsAverage': ratingsAverage,
  //       'createdAt': createdAt?.toIso8601String(),
  //       'updatedAt': updatedAt?.toIso8601String(),
  //       'id': id,
  //       'priceAfterDiscount': priceAfterDiscount,
  //       'availableColors': availableColors,
  //     };

  @override
  List<Object?> get props {
    return [
      sold,
      images,
      subcategory,
      ratingsQuantity,
      id,
      title,
      slug,
      description,
      quantity,
      price,
      imageCover,
      category,
      brand,
      ratingsAverage,
      createdAt,
      updatedAt,
      id,
      priceAfterDiscount,
      availableColors,
    ];
  }
}
