import 'package:flutter/material.dart';

import '/pages/singup/widgets/singup_page_body.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingupPageBody(),
    );
  }
}
