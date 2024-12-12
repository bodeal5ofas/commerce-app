import 'package:ecommerce_app/core/utils/mytheme.dart';
import 'package:flutter/material.dart';

class CustomTextFieldProfile extends StatelessWidget {
  const CustomTextFieldProfile(
      {super.key, required this.textController, required this.text});
  final TextEditingController textController;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.edit_outlined,
          color: Mytheme.mainColor,
          size: 30,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
