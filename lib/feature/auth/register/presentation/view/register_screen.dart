import 'package:ecommerce_app/core/utils/custom_text_form.dart';
import 'package:ecommerce_app/core/utils/mytheme.dart';
import 'package:ecommerce_app/feature/auth/login/presentation/view/login_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static String id = 'Register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  ThemeData mytheme = Mytheme().mainTheme;
  TextEditingController nameController = TextEditingController();
  TextEditingController mobilController = TextEditingController();
  TextEditingController emailController = TextEditingController();
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
                  'Full Name',
                  style: mytheme.textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    hintText: 'Enter your Full Name',
                    controller: nameController),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Mobil Number',
                  style: mytheme.textTheme.titleLarge,
                ),
                CustomTextFormField(
                  hintText: 'Enter your Mobil',
                  controller: mobilController,
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
                  controller: emailController,
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
                      'Register',
                      style: mytheme.textTheme.titleLarge!
                          .copyWith(color: mytheme.primaryColor),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, LoginScreen.id);
                  },
                  child: Text(
                    'Already Have an Acoount',
                    style: mytheme.textTheme.titleLarge!.copyWith(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
