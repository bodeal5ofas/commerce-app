import 'dart:developer';

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.isPasword = false,
      this.isEmail = false,
      this.textInput,
      this.suffixIcon,
      required this.hintText,
      required this.controller});
  final bool isPasword;
  final TextInputType? textInput;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final String hintText;
  final bool isEmail;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        focusColor: Colors.white,
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
     // controller: controller,
      onChanged: (value) {
        log('text field ${controller.text}');
      },
      obscureText: isPasword,
      keyboardType: textInput,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'this field is required';
        }
        if (isEmail) {
          final bool emailValid = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value);
          if (!emailValid) {
            return 'this email is unVaildate change it';
          }
        } else if (isPasword) {
          if (value.length < 6) {
            return 'the password less than 6 character';
          }
        }
        return null;
      },
    );
  }
}
