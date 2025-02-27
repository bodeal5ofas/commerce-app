import 'package:ecommerce_app/core/service_locater.dart';
import 'package:ecommerce_app/feature/auth/login/data/repos/login_repo.dart';
import 'package:ecommerce_app/feature/auth/login/presentation/view/login_screen.dart';
import 'package:ecommerce_app/feature/auth/login/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:ecommerce_app/feature/auth/register/data/repo/register_repo.dart';
import 'package:ecommerce_app/feature/auth/register/presentation/view/register_screen.dart';
import 'package:ecommerce_app/feature/auth/register/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:ecommerce_app/feature/home/data/models/category_tab/product/datum.dart';
import 'package:ecommerce_app/feature/home/data/repo/app/app_repo.dart';
import 'package:ecommerce_app/feature/home/data/repo/cart_repo/cart_repo.dart';
import 'package:ecommerce_app/feature/home/data/repo/favorite_repo/favorite_repo.dart';
import 'package:ecommerce_app/feature/home/data/repo/favorite_repo/favorite_repo_impl.dart';
import 'package:ecommerce_app/feature/home/presentation/view/home_view.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/category/cart/cart_view.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/category/product_details.dart';
import 'package:ecommerce_app/feature/home/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_app/feature/home/presentation/view_model/favoritue_cubit/favorite_cubit.dart';
import 'package:ecommerce_app/feature/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:ecommerce_app/feature/splash/presentation/view/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static String kloginView = '/loginView';
  static String kDetailsView = '/detailsView';
  static String kregisterView = '/registerView';
  static String kHomewView = '/homeView';
  static String kCartView = '/cartView';
  static GoRouter goRouter = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: kloginView,
      builder: (context, state) => BlocProvider(
        create: (context) => LoginCubit(getIt.get<LoginRepo>()),
        child: const LoginScreen(),
      ),
    ),
    GoRoute(
      path: kregisterView,
      builder: (context, state) => BlocProvider(
        create: (context) => RegisterCubit(getIt.get<RegisterRepo>()),
        child: const RegisterScreen(),
      ),
    ),
    GoRoute(
      path: kHomewView,
      builder: (context, state) => BlocProvider(
        create: (context) => HomeCubit(getIt.get<AppRepo>()),
        child: const HomeView(),
      ),
    ),
    GoRoute(
        path: kDetailsView,
        builder: (context, state) {
          ProductModel args = state.extra as ProductModel;
          return
              // BlocProvider(
              //   create: (context) => FavoriteCubit(getIt.get<FavoriteRepo>()),
              //   child:
              ProductDetails(
            productModel: args,
          );
        }),
    GoRoute(
      path: kCartView,
      builder: (context, state) => BlocProvider(
        create: (context) => CartCubit(getIt.get<CartRepo>())..getCartProduct(),
        child: const CartView(),
      ),
    ),
  ]);
}
