import 'dart:async';


import 'package:ecommerce_app/feature/auth/login/presentation/view/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static String id = 'Splash';
  @override
  Widget build(BuildContext context) {
    Timer(
     const Duration(seconds: 5),
      () => Navigator.pushReplacementNamed(context, LoginScreen.id),
    );
    return Scaffold(
      body: Image.asset('assets/images/Splash Screen.png',
      fit: BoxFit.fill,
      height: double.infinity,
      width: double.infinity,
      ),
    );
  }
}
