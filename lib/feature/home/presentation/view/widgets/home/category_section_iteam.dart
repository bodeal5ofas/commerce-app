import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/feature/home/data/models/home_tape/category_response.dart';
import 'package:flutter/material.dart';

class CategorySectionIteam extends StatelessWidget {
  const CategorySectionIteam({super.key, required this.categoryResponse});
  final CategoryResponse categoryResponse;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(150),
            child: CachedNetworkImage(
              imageUrl: categoryResponse.image!,
              // placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          // child: CircleAvatar(
          //   radius: 100,
          //   backgroundImage: categoryResponse.image != null
          //       ? NetworkImage(categoryResponse.image!)
          //       : const AssetImage('assets/images/error-image.png'),
          // ),
        ),
        Expanded(
            flex: 1,
            child: Text(
              categoryResponse.name ?? '',
              textWidthBasis: TextWidthBasis.longestLine,
            )),
      ],
    );
  }
}
