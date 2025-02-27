import 'package:ecommerce_app/core/utils/mytheme.dart';
import 'package:flutter/material.dart';

class AccountTextField extends StatelessWidget {
  const AccountTextField(
      {super.key, required this.textController, this.isPassword = false});
  final TextEditingController textController;
  final bool isPassword;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      controller: textController,
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.mode_edit_outline_outlined,
          color: Mytheme.mainColor,
          size: 30,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
