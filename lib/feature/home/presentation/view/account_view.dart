import 'package:ecommerce_app/core/utils/app_routes.dart';
import 'package:ecommerce_app/core/utils/mytheme.dart';
import 'package:ecommerce_app/core/utils/shared_prefrence_utils.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/account/account_text_field.dart';
import 'package:ecommerce_app/feature/home/presentation/view/widgets/custom_logo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  TextEditingController nameController = TextEditingController(
      text: SharedPrefrenceUtils.get(key: 'name').toString());
  TextEditingController emailController = TextEditingController(
      text: SharedPrefrenceUtils.get(key: 'email').toString());
  TextEditingController passwordController = TextEditingController(
      text: SharedPrefrenceUtils.get(key: 'password').toString());
  TextEditingController phoneController = TextEditingController(
      text: SharedPrefrenceUtils.get(key: 'phone').toString());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomLogo(),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Welcome,',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                IconButton(
                    onPressed: () {
                      SharedPrefrenceUtils.delete(key: 'token');
                      GoRouter.of(context)
                          .pushReplacement(AppRoutes.kloginView);
                    },
                    icon: Icon(
                      Icons.logout,
                      color: Mytheme.mainColor,
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              emailController.text,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Mytheme.mainColor.withOpacity(0.3)),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Your Full Name',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            AccountTextField(textController: nameController),
            Text(
              'Your E-Mail',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            AccountTextField(textController: emailController),
            Text(
              'Your Password',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            AccountTextField(
              textController: passwordController,
              isPassword: true,
            ),
            Text(
              'Your Mobile Number',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            AccountTextField(textController: phoneController),
          ],
        ),
      ),
    );
  }
}
