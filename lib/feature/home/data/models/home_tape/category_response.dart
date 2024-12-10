import 'package:equatable/equatable.dart';

class CategoryResponse extends Equatable {
  final String? id;
  final String? name;
  final String? slug;
  final String? image;

  const CategoryResponse({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    return CategoryResponse(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'slug': slug,
        'image': image,
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      slug,
      image,
    ];
  }
}
