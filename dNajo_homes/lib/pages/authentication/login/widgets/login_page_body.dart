import 'package:dnajo_homes/pages/authentication/login/widgets/background.dart';
import 'package:dnajo_homes/pages/main_screen/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/dn_form_field.dart';
import '../../../../components/dn_password_form_field.dart';
import '../../../../utils/theme.dart';
import '../../../drawer/home_navigation.dart';
import '../../singup/singup_page.dart';
import '/components/already_have_account_check.dart';
import '/components/rounded_button.dart';

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
              Column(
                children: [
                  SizedBox(height: size.height * 0.04),
                  DNFormField(
                      hint: 'Email address',
                      title: 'Email address',
                      controller: _emailCtrl,
                      emailType: true),
                  DNPasswordFormField(create: false, controller: _passwordCtrl),
                  RoundedButton(
                    text: "LOGIN",
                    onPressed: () {
                      (_emailCtrl.text == "" || _passwordCtrl.text == "")
                          ? ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Fields cannot be empty")))
                          : _logUserIn(
                              _emailCtrl.text, _passwordCtrl.text, context);
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
            ],
          ),
        ),
      ),
    );
  }

  _logUserIn(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        User? user = FirebaseAuth.instance.currentUser;

        if (user != null && !user.emailVerified) {
          await user.sendEmailVerification();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Check your mail for verification")));
        }
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const MainScreen()),
            (route) => false);
        throw Exception(Exception);
      });
      if (userCredential.user?.displayName != null) {
        // Get.off(() => const NavigationHomePage());
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const MainScreen()),
            (route) => false);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Login failed")));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("User not found")));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Wrong password for this user")));
      } else if (e.code == 'wrong-email') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Check your email")));
      }
    }
  }
}
