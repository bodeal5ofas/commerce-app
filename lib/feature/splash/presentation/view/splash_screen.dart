import 'dart:async';
import 'package:ecommerce_app/core/utils/app_routes.dart';
import 'package:ecommerce_app/core/utils/shared_prefrence_utils.dart';
import 'package:ecommerce_app/feature/auth/login/presentation/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static String id = 'Splash';
  @override
  Widget build(BuildContext context) {
    var token = SharedPrefrenceUtils.get(key: 'token');
    Timer(const Duration(seconds: 5), () {
      token == null
          ? GoRouter.of(context).push(AppRoutes.kloginView)
          : GoRouter.of(context).push(AppRoutes.kHomewView);
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Image.asset(
            'assets/images/splash.jpg',
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
