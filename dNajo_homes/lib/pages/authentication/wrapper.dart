// ignore_for_file: implementation_imports
import 'package:dnajo_homes/pages/main_screen/main_screen.dart';
import 'package:dnajo_homes/pages/welcome/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';



class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    if (_auth.currentUser != null) {
      return const MainScreen();
    } else {
      return const WelcomePage();
    }
  }
}
