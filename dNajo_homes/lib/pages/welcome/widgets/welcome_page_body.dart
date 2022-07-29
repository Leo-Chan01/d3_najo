import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../auth/login/login_page.dart';
import '../../auth/singup/singup_page.dart';
import '/components/rounded_button.dart';
import '/pages/welcome/widgets/background.dart';
import '/utils/constants.dart';

class WelcomePageBody extends StatelessWidget {
  const WelcomePageBody({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.2),
            const Text(
              "WELCOME",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: Colors.white,
              ),
            ),
            SizedBox(height: size.height * 0.5),
            RoundedButton(
              text: "LOGIN",
              onPressed: () {
                Get.off(() => const LoginPage());
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              onPressed: () {
                Get.off(() => const SignUpPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
