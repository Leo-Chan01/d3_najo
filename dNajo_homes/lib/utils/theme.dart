import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromRGBO(184, 134, 11, 1.0);
const kPrimaryLightColor = Color(0xffffd700);
const kPrimary50 = Colors.black;
const kPrimary25 = Color(0x40F22C2C);
const kPrimary10 = Color(0x1AF22C2C);

ThemeData appTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(primary: kPrimaryColor),
    toggleableActiveColor: kPrimaryColor,
    appBarTheme: const AppBarTheme(
        color: Colors.white30, foregroundColor: kPrimaryColor, elevation: 0),
    textTheme: const TextTheme(
        headline4: TextStyle(fontSize: 32, color: kPrimaryLightColor),
        headline5: TextStyle(color: kPrimaryLightColor)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ))),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      isDense: true,
      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
    ));
