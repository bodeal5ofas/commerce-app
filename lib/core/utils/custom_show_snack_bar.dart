import 'package:flutter/material.dart';

customShowSnackBar({required BuildContext context, required String message}) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(message)));
}
