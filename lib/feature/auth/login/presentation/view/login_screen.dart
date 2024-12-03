
import 'package:ecommerce_app/core/utils/custom_text_form.dart';
import 'package:ecommerce_app/core/utils/mytheme.dart';
import 'package:ecommerce_app/feature/auth/register/presentation/view/register_screen.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = 'Login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ThemeData mytheme = Mytheme().mainTheme;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  IconData iconPassword = Icons.visibility_off;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
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
                  'User Name',
                  style: mytheme.textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    hintText: 'Enter your Name', controller: nameController),
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
                    if (formKey.currentState!.validate()) {
                      //login account
                    }
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
                      Navigator.pushReplacementNamed(
                          context, RegisterScreen.id);
                    },
                    child: Text(
                      'Don’t have an account? Create Account',
                      style:
                          mytheme.textTheme.titleLarge!.copyWith(fontSize: 18),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

}
