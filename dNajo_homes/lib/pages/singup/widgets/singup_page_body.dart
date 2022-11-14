import 'package:dnajo_homes/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';

import '../../../components/dn_form_field.dart';
import '../../../components/dn_password_form_field.dart';
import '../../drawer/home_navigation.dart';
import '/components/already_have_account_check.dart';
import '/components/rounded_button.dart';
import '/components/rounded_input_field.dart';
import '/components/rounded_password_field.dart';
import '/pages/login/login_page.dart';
import '/pages/singup/widgets/background.dart';
import '/pages/singup/widgets/or_divider.dart';

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
              Container(
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                          spreadRadius: 1.0)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.04),
                    DNFormField(
                        hint: 'Email address',
                        title: 'Email address',
                        controller: _emailCtrl,
                        emailType: true),
                    DNPasswordFormField(
                        create: true, controller: _passwordCtrl),
                    RoundedButton(
                      text: "SIGNUP",
                      onPressed: () {
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
}
