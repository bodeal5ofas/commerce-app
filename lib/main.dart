import 'dart:developer';

import 'package:ecommerce_app/core/service_locater.dart';
import 'package:ecommerce_app/core/utils/api_keys.dart';
import 'package:ecommerce_app/core/utils/app_routes.dart';
import 'package:ecommerce_app/core/utils/mytheme.dart';
import 'package:ecommerce_app/core/utils/shared_prefrence_utils.dart';
import 'package:ecommerce_app/core/utils/stripe_service.dart';
import 'package:ecommerce_app/feature/auth/register/data/models/customer_model/customer_model.dart';
import 'package:ecommerce_app/feature/home/data/models/payment_stripe/payment_input_model.dart';
//import 'package:ecommerce_app/feature/auth/login/presentation/view/login_screen.dart';
//import 'package:ecommerce_app/feature/auth/register/presentation/view/register_screen.dart';
//import 'package:ecommerce_app/feature/splash/presentation/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  Stripe.publishableKey = ApiKeys.publishedKey;
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefrenceUtils.init();
  setUpLocator();
  // var id=SharedPrefrenceUtils.get(key: 'id') as String;
  // StripeService().makePayment(paymentInputModel: PaymentInputModel(ccurency: "USD", customerId: id, amount: 100));
  runApp(const ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp.router(
        routerConfig: AppRoutes.goRouter,
        debugShowCheckedModeBanner: false,
        // routes: {
        //     SplashScreen.id:(context)=> const SplashScreen(),
        //     LoginScreen.id:(context)=> const LoginScreen(),
        //     RegisterScreen.id:(context)=>const RegisterScreen(),
        // },
        // initialRoute: SplashScreen.id,
        theme: Mytheme().mainTheme,
      ),
    );
  }
}
