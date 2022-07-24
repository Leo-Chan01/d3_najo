import 'package:flutter/material.dart';

import '/pages/welcome/widgets/welcome_page_body.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WelcomePageBody(),
    );
  }
}
