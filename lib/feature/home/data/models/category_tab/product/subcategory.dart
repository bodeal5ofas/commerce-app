import 'package:equatable/equatable.dart';

class Subcategory extends Equatable {
  final String? id;
  final String? name;
  final String? slug;
  final String? category;

  const Subcategory({this.id, this.name, this.slug, this.category});

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        slug: json['slug'] as String?,
        category: json['category'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'slug': slug,
        'category': category,
      };

  @override
  List<Object?> get props => [id, name, slug, category];
}
