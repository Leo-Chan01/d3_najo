import 'package:dnajo_homes/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../drawer/home_navigation.dart';
import '/pages/forgot_password/forgot_password_page.dart';
import '/components/already_have_account_check.dart';
import '/components/rounded_password_field.dart';
import '/pages/singup/singup_page.dart';
import '/components/rounded_button.dart';
import '/components/rounded_input_field.dart';
import '/pages/login/widgets/background.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          child: Column(
            children: <Widget>[
              const Text(
                'Welcome back',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.04),
              Container(
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: kPrimaryColor,
                          blurRadius: 10.0,
                          spreadRadius: 1.0)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.04),
                    RoundedInputField(
                      hintText: "Your Email",
                      onChanged: (value) {},
                    ),
                    RoundedPasswordField(
                      onChanged: (value) {},
                    ),
                    RoundedButton(
                      text: "LOGIN",
                      onPressed: () {
                        Get.off(() => const NavigationHomePage());
                      },
                    ),
                    SizedBox(height: size.height * 0.03),
                    AlreadyHaveAnAccountCheck(
                      onTap: () {
                        Get.to(() => const SignUpPage());
                      },
                    ),
                    SizedBox(height: size.height * 0.04),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
