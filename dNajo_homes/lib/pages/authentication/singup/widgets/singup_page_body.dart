import 'dart:math';

import 'package:dnajo_homes/pages/authentication/singup/widgets/background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';

import '../../../../components/dn_form_field.dart';
import '../../../../components/dn_password_form_field.dart';
import '../../../drawer/home_navigation.dart';
import '../../login/login_page.dart';
import '/components/already_have_account_check.dart';
import '/components/rounded_button.dart';
import 'or_divider.dart';

class SingupPageBody extends StatelessWidget {
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

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
              Column(
                children: [
                  SizedBox(height: size.height * 0.04),
                  DNFormField(
                      hint: 'Email address',
                      title: 'Email address',
                      controller: _emailCtrl,
                      emailType: true),
                  DNPasswordFormField(create: true, controller: _passwordCtrl),
                  RoundedButton(
                    text: "SIGNUP",
                    onPressed: () {
                      (_emailCtrl.text == "" || _passwordCtrl.text == "")
                          ? ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Cannot sign up with empty fields")))
                          : _signUserUpWEmailandPass(
                              _emailCtrl.text, _passwordCtrl.text, context);
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
              )
            ],
          ),
        ),
      ),
    );
  }

  void _signUserUpWEmailandPass(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        User? user = FirebaseAuth.instance.currentUser;

        if (user != null && !user.emailVerified) {
          await user.sendEmailVerification();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Check your mail for verification")));
        }
        Get.off(() => const NavigationHomePage());
        throw Exception(e);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Password too weak")));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content:
                Text("Account already Exists for that mail, please login")));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
