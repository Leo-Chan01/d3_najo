import 'package:flutter/material.dart';

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
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.02),
            Image(
              image: const AssetImage(
                "assets/images/logo.png",
              ),
              height: size.height * 0.3,
            ),
            SizedBox(height: size.height * 0.03),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ForgotPasswordPage();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SignUpPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
