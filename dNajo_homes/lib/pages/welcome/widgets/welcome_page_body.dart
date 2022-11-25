import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../authentication/login/login_page.dart';
import '../../authentication/singup/singup_page.dart';
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
            Image.asset("assets/images/logo.png", scale: 0.01, width: 200),
            SizedBox(height: size.height * 0.5),
            RoundedButton(
              text: "LOGIN",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              onPressed: () {
                Get.off(() => const LoginPage());
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: Colors.white,
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
