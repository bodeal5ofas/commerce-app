import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/feature/auth/login/data/repos/login_repo.dart';
import 'package:ecommerce_app/feature/auth/login/data/repos/login_repo_impl.dart';
import 'package:ecommerce_app/feature/auth/register/data/repo/register_repo.dart';
import 'package:ecommerce_app/feature/auth/register/data/repo/register_repo_impl.dart';
import 'package:ecommerce_app/feature/home/data/repo/app/app_repo.dart';
import 'package:ecommerce_app/feature/home/data/repo/app/app_repo_impl.dart';
import 'package:ecommerce_app/feature/home/data/repo/cart_repo/cart_repo.dart';
import 'package:ecommerce_app/feature/home/data/repo/cart_repo/cart_repo_impl.dart';
import 'package:ecommerce_app/feature/home/data/repo/category/category_repo.dart';
import 'package:ecommerce_app/feature/home/data/repo/category/category_repo_impl.dart';
import 'package:ecommerce_app/feature/home/data/repo/favorite_repo/favorite_repo.dart';
import 'package:ecommerce_app/feature/home/data/repo/favorite_repo/favorite_repo_impl.dart';
import 'package:ecommerce_app/feature/home/data/repo/home/home_repo.dart';
import 'package:ecommerce_app/feature/home/data/repo/home/home_repo_impl.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
void setUpLocator() async {
  getIt.registerSingleton<ApiService>((ApiService(Dio())));
  getIt.registerSingleton<RegisterRepo>(
      RegisterRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<LoginRepo>(LoginRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<HomeRepo>(HomeRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<CategoryRepo>(
      CategoryRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<AppRepo>(AppRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<CartRepo>(CartRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<FavoriteRepo>(FavoriteRepoImpl(getIt.get<ApiService>()));
}
