import 'package:ecommerce_app/core/utils/mytheme.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/custom_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class CustomBanerSection extends StatelessWidget {
  const CustomBanerSection({super.key, required this.images});
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      width: double.infinity,

      height: 200,

      initialPage: 0,

      indicatorColor: Mytheme.mainColor,

      indicatorBackgroundColor: Colors.white,
      // onPageChanged: (value) {
      //   print('Page changed: $value');
      // },
      autoPlayInterval: 3000,
      isLoop: false,
      // children: images.map(
      //   (urlImage) {
      //     return Image.network(urlImage,fit: BoxFit.fill,);
      //   },
      // ).toList(),
      children: [
        CustomLogo(
          imageUrl: images[0],
        ),
        CustomLogo(
          imageUrl: images[1],
        ),
        CustomLogo(
          imageUrl: images[2],
        ),
      ],
    );
  }
}
