import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({
    this.imageUrl,
    super.key,
  });
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageUrl ?? 'assets/images/route_appbar.png',
      fit: BoxFit.fill,
    );
  }
}
