import 'package:ecommerce_app/core/utils/mytheme.dart';
import 'package:ecommerce_app/feature/auth/login/presentation/view/login_screen.dart';
import 'package:ecommerce_app/feature/auth/register/presentation/view/register_screen.dart';
import 'package:ecommerce_app/feature/splash/presentation/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const ECommerceApp());
}
class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(designSize:const Size(430, 932),
    minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
            SplashScreen.id:(context)=> const SplashScreen(),
            LoginScreen.id:(context)=> const LoginScreen(),
            RegisterScreen.id:(context)=>const RegisterScreen(),
        },
        initialRoute: SplashScreen.id,
        theme: Mytheme().mainTheme,
      ),
    );
  }
}

