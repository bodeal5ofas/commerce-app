import 'package:ecommerce_app/core/service_locater.dart';
import 'package:ecommerce_app/feature/auth/login/data/repos/login_repo.dart';
import 'package:ecommerce_app/feature/auth/login/presentation/view/login_screen.dart';
import 'package:ecommerce_app/feature/auth/login/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:ecommerce_app/feature/auth/register/data/repo/register_repo.dart';
import 'package:ecommerce_app/feature/auth/register/presentation/view/register_screen.dart';
import 'package:ecommerce_app/feature/auth/register/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:ecommerce_app/feature/home/presentation/view/home_view.dart';
import 'package:ecommerce_app/feature/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:ecommerce_app/feature/splash/presentation/view/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static String kloginView = '/loginView';
  static String kregisterView = '/registerView';
  static String kHomewView = '/homeView';
  static GoRouter goRouter = GoRouter(routes: [
    // GoRoute(
    //   path: '/',
    //   builder: (context, state) => const SplashScreen(),
    // ),
    // GoRoute(
    //   path: kloginView,
    //   builder: (context, state) => BlocProvider(
    //     create: (context) => LoginCubit(getIt.get<LoginRepo>()),
    //     child: const LoginScreen(),
    //   ),
    // ),
    // GoRoute(
    //   path: kregisterView,
    //   builder: (context, state) => BlocProvider(
    //     create: (context) => RegisterCubit(getIt.get<RegisterRepo>()),
    //     child: const RegisterScreen(),
    //   ),
    // ),
    GoRoute(
      //     path: kHomewView,
      path: '/',
      builder: (context, state) => BlocProvider(
        create: (context) => HomeCubit(),
        child: const HomeView(),
      ),
    ),
  ]);
}
