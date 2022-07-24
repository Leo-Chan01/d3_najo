import 'package:flutter/material.dart';
import 'package:real_estate/pages/welcome/welcome_page.dart';

import 'utils/constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);
  // This widget is the root of your application.import 'package:settings_ui/settings_ui.dart';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: kPrimaryColor,
        ),
      ),
      home: const WelcomePage(),
    );
  }
}
