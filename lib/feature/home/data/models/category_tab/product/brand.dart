import 'package:equatable/equatable.dart';

class Brand extends Equatable {
  final String? id;
  final String? name;
  final String? slug;
  final String? image;

  const Brand({this.id, this.name, this.slug, this.image});

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        slug: json['slug'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'slug': slug,
        'image': image,
      };

  @override
  List<Object?> get props => [id, name, slug, image];
}
