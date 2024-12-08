import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/feature/auth/login/data/repos/login_repo.dart';
import 'package:ecommerce_app/feature/auth/login/data/repos/login_repo_impl.dart';
import 'package:ecommerce_app/feature/auth/register/data/repo/register_repo.dart';
import 'package:ecommerce_app/feature/auth/register/data/repo/register_repo_impl.dart';
import 'package:ecommerce_app/feature/home/data/repo/home/home_repo.dart';
import 'package:ecommerce_app/feature/home/data/repo/home/home_repo_impl.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
void setUpLocator() async {
  getIt.registerSingleton<RegisterRepo>(RegisterRepoImpl(ApiService(Dio())));
  getIt.registerSingleton<LoginRepo>(LoginRepoImpl(ApiService(Dio())));
  getIt.registerSingleton<HomeRepo>(HomeRepoImpl(ApiService(Dio())));
}
