import 'dart:developer';

import 'package:ecommerce_app/core/utils/app_routes.dart';
import 'package:ecommerce_app/core/utils/custom_show_snack_bar.dart';
import 'package:ecommerce_app/core/utils/custom_text_form.dart';
import 'package:ecommerce_app/core/utils/mytheme.dart';
import 'package:ecommerce_app/feature/auth/register/presentation/view_model/register_cubit/register_cubit.dart';
//import 'package:ecommerce_app/feature/auth/login/presentation/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static String id = 'Register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  ThemeData mytheme = Mytheme().mainTheme;
  late RegisterCubit registerProvider;
  IconData iconPassword = Icons.visibility_off;
  bool isPassword = true;
  @override
  void initState() {
    registerProvider = BlocProvider.of<RegisterCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSucessfullState) {
          customShowSnackBar(context: context, message: 'Register Sucessfully');
          GoRouter.of(context).pushReplacement(AppRoutes.kloginView);
        } else if (state is RegisterFailureState) {
          log(state.errMessage);
          customShowSnackBar(context: context, message: state.errMessage);
        } else {
          customShowSnackBar(context: context, message: "Loading");
        }
      },
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: registerProvider.formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset('assets/images/route name.png'),
                  Text(
                    'Full Name',
                    style: mytheme.textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                      hintText: 'Enter your Full Name',
                      controller: registerProvider.nameController),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Mobil Number',
                    style: mytheme.textTheme.titleLarge,
                  ),
                  CustomTextFormField(
                    hintText: 'Enter your Mobil',
                    controller: registerProvider.mobilController,
                    textInput: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Email Address',
                    style: mytheme.textTheme.titleLarge,
                  ),
                  CustomTextFormField(
                    hintText: 'Enter your Emaill',
                    controller: registerProvider.emailController,
                    isEmail: true,
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
                    controller: registerProvider.passwordController,
                    isPasword: isPassword,
                    suffixIcon: IconButton(
                        onPressed: () {
                          if (iconPassword == Icons.visibility_off) {
                            isPassword = false;
                            iconPassword = Icons.visibility;
                          } else {
                            isPassword = true;
                            iconPassword = Icons.visibility_off;
                          }
                          setState(() {});
                        },
                        icon: Icon(iconPassword)),
                  ),
                  Text(
                    'Repassword',
                    style: mytheme.textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    hintText: 'Enter Confirm password',
                    controller: registerProvider.repasswordController,
                    isPasword: isPassword,
                    suffixIcon: IconButton(
                        onPressed: () {
                          if (iconPassword == Icons.visibility_off) {
                            isPassword = false;
                            iconPassword = Icons.visibility;
                          } else {
                            isPassword = true;
                            iconPassword = Icons.visibility_off;
                          }
                          setState(() {});
                        },
                        icon: Icon(iconPassword)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // register code
                      registerProvider.register();
                    },
                    child: Center(
                      child: Text(
                        'Register',
                        style: mytheme.textTheme.titleLarge!
                            .copyWith(color: mytheme.primaryColor),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRoutes.kloginView);
                    },
                    child: Text(
                      'Already Have an Acoount',
                      style:
                          mytheme.textTheme.titleLarge!.copyWith(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
