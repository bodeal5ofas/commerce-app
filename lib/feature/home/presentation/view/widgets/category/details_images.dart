import 'package:ecommerce_app/core/utils/mytheme.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/favoritue_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class DetailsImages extends StatelessWidget {
  const DetailsImages({super.key, required this.images});
  final List<dynamic> images;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Mytheme.mainColor),
        //  borderRadius: BorderRadius.circular(40),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          ClipRRect(
            //  borderRadius: BorderRadius.circular(40),
            child: ImageSlideshow(
              //width: double.infinity,

              height: 200,
              initialPage: 0,
              indicatorColor: Mytheme.mainColor,
              indicatorBackgroundColor: Colors.white,
              // onPageChanged: (value) {
              //   print('Page changed: $value');
              // },
              autoPlayInterval: 3000,
              isLoop: false,

              children: images.map(
                (urlImage) {
                  return Image.network(
                    urlImage,
                    fit: BoxFit.fill,
                  );
                },
              ).toList(),
            ),
          ),
          FavoriteIconWidget(),
        ],
      ),
    );
  }
}
