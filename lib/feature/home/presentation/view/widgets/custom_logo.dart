import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({
    this.imageUrl,
    super.key,
  });
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Image.asset(
        imageUrl ?? 'assets/images/logo.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
