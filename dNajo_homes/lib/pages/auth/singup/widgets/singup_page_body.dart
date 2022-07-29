import 'package:dnajo_homes/pages/home/home_page.dart';
import 'package:dnajo_homes/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';

import '../../../drawer/home_navigation.dart';
import '../../login/login_page.dart';
import '/components/already_have_account_check.dart';
import '/components/rounded_button.dart';
import '/components/rounded_input_field.dart';
import '/components/rounded_password_field.dart';
import 'background.dart';
import 'or_divider.dart';

class SingupPageBody extends StatelessWidget {
  final _emailCtrl = TextEditingController();
  final _passWordCtrl = TextEditingController();

  SingupPageBody({
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
              SizedBox(height: size.height * 0.02),
              const Text(
                'Welcome',
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
                      controller: _emailCtrl,
                      hintText: "Your Email",
                      onChanged: (value) {},
                    ),
                    RoundedPasswordField(
                      controller: _passWordCtrl,
                      onChanged: (value) {},
                    ),
                    RoundedButton(
                      text: "SIGNUP",
                      onPressed: () {
                        _signUserUp(_emailCtrl.text, _passWordCtrl.text);
                        Get.off(() => const NavigationHomePage());
                      },
                    ),
                    SizedBox(height: size.height * 0.03),
                    AlreadyHaveAnAccountCheck(
                      login: false,
                      onTap: () {
                        Get.off(() => const LoginPage());
                      },
                    ),
                    const OrDivider(),
                    Column(
                      children: <Widget>[
                        SignInButton(
                          Buttons.Facebook,
                          onPressed: () {},
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: SignInButton(
                            Buttons.Google,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.04),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // FirebaseAuth.instance
  // .authStateChanges()
  // .listen((User? user) {
  //   if (user == null) {
  //     print('User is currently signed out!');
  //   } else {
  //     print('User is signed in!');
  //   }
  // });

  void _signUserUp(String email, String password) async {
    var auth = FirebaseAuth.instance;
    await auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      if (kDebugMode) {
        print(value);
      }
      Get.snackbar('message', value.toString());
      Get.off(() => const NavigationHomePage());
    });
  }
}
