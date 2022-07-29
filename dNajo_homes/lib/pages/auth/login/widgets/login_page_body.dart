import 'package:dnajo_homes/pages/auth/login/widgets/background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../../drawer/home_navigation.dart';
import '../../singup/singup_page.dart';
import '/components/already_have_account_check.dart';
import '/components/rounded_password_field.dart';
import '/components/rounded_button.dart';
import '/components/rounded_input_field.dart';

class LoginPageBody extends StatelessWidget {
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  var _isLoading = false;

  LoginPageBody({
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
                      controller: _emailCtrl,
                      hintText: "Your Email",
                      onChanged: (value) {},
                    ),
                    RoundedPasswordField(
                      controller: _passwordCtrl,
                      onChanged: (value) {},
                    ),
                    _isLoading == false
                        ? RoundedButton(
                            text: "LOGIN",
                            onPressed: () {
                              _logUserIn(_emailCtrl.text, _passwordCtrl.text);
                              Get.off(() => const NavigationHomePage());
                            },
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
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

  _logUserIn(String emailAddress, String password) async {
    try {
      // ignore: unused_local_variable
      _isLoading = true;
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password)
          .then((value) {
        Get.snackbar('Message', 'Logged in successfully');
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        if (kDebugMode) {
          print('No user found for that email.');
        }
      } else if (e.code == 'wrong-password') {
        if (kDebugMode) {
          print('Wrong password provided for that user.');
        }
      }
    } finally {
      _isLoading = false;
    }
  }
}
