import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/dn_form_field.dart';
import '../../../components/dn_password_form_field.dart';
import '../../../utils/constants.dart';
import '../../drawer/home_navigation.dart';
import '/components/already_have_account_check.dart';
import '/pages/singup/singup_page.dart';
import '/components/rounded_button.dart';
import '/pages/login/widgets/background.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _emailCtrl = TextEditingController();
    final _passwordCtrl = TextEditingController();
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
                    color: kPrimaryColor,
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
                    // RoundedInputField(
                    //   hintText: "Your Email",
                    //   onChanged: (value) {},
                    // ),

                    DNFormField(
                        hint: 'Email address',
                        title: 'Email address',
                        controller: _emailCtrl,
                        emailType: true),
                    // RoundedPasswordField(
                    //   onChanged: (value) {},
                    // ),
                    DNPasswordFormField(
                        create: true, controller: _passwordCtrl),
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
