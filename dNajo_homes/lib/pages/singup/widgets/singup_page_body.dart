import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

import '/components/already_have_account_check.dart';
import '/components/rounded_button.dart';
import '/components/rounded_input_field.dart';
import '/components/rounded_password_field.dart';
import '/pages/login/login_page.dart';
import '/pages/singup/widgets/background.dart';
import '/pages/singup/widgets/or_divider.dart';

class SingupPageBody extends StatelessWidget {
  const SingupPageBody({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Background(
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.02),
            Image(
              image: const AssetImage(
                "assets/images/logo.png",
              ),
              height: size.height * 0.3,
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
              onPressed: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginPage();
                    },
                  ),
                );
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
            )
          ],
        ),
      ),
    );
  }
}
