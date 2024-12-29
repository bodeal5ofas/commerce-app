import 'dart:developer';

import 'package:ecommerce_app/core/utils/app_routes.dart';
import 'package:ecommerce_app/core/utils/custom_show_snack_bar.dart';
import 'package:ecommerce_app/core/utils/custom_text_form.dart';
import 'package:ecommerce_app/core/utils/mytheme.dart';
import 'package:ecommerce_app/core/utils/shared_prefrence_utils.dart';
import 'package:ecommerce_app/feature/auth/login/presentation/view_model/login_cubit/login_cubit.dart';
//import 'package:ecommerce_app/feature/auth/register/presentation/view/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = 'Login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ThemeData mytheme = Mytheme().mainTheme;

  IconData iconPassword = Icons.visibility_off;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late LoginCubit loginCubit;
  @override
  void initState() {
    loginCubit = BlocProvider.of<LoginCubit>(context);
    log("init ${emailController.text}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          customShowSnackBar(
              context: context,
              message: 'Suceess,Welcome: ${state.loginResponse.user!.name}');
          SharedPrefrenceUtils.set(
              key: 'token', value: state.loginResponse.token);
          GoRouter.of(context).pushReplacement(AppRoutes.kHomewView);
        } else if (state is LoginFailureState) {
          customShowSnackBar(context: context, message: state.errMessage);
        } else {
          customShowSnackBar(context: context, message: 'loading');
        }
      },
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(10),
           child: Form(
            key: loginCubit.formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset('assets/images/route name.png'),
                  Text(
                    'Welcome Back To Route',
                    style: mytheme.textTheme.titleLarge,
                  ),
                  const Text(
                    'Please sign in with your mail',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Email',
                    style: mytheme.textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                      hintText: 'Enter your Email',
                      controller: emailController),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Password',
                    style: mytheme.textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    hintText: 'Enter your password',
                    controller: passwordController,
                    isPasword: true,
                    suffixIcon: IconButton(
                        onPressed: () {
                          if (iconPassword == Icons.visibility_off) {
                            iconPassword = Icons.visibility;
                          } else {
                            iconPassword = Icons.visibility_off;
                          }
                          setState(() {});
                        },
                        icon: Icon(iconPassword)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Forgot password',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w400)),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      loginCubit.login(
                          email: emailController.text,
                          password: passwordController.text);
                    },
                    child: Center(
                      child: Text(
                        'Login',
                        style: mytheme.textTheme.titleLarge!
                            .copyWith(color: mytheme.primaryColor),
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        GoRouter.of(context).push(AppRoutes.kregisterView);
                      },
                      child: Text(
                        'Don’t have an account? Create Account',
                        style: mytheme.textTheme.titleLarge!
                            .copyWith(fontSize: 18),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
