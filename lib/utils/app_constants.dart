import 'package:flutter/material.dart';

class AppConstants {
  static RegExp nameRegExp = RegExp('[A-Za-z]');

  //gradient
  static LinearGradient appGradient = const LinearGradient(colors: [
    appGreen,
    appPink,
    appOrange,
    appYellow
  ], stops: [
    0.1,
    0.4,
    0.6,
    0.9,
  ]);

  //Colors
  static const signinBackground = Color(0xFFF1F1F1);
  static const signinBackgroundActive = Color(0xFFFDE9DA);
  static const appPink = Color(0xFFFE4FB7);
  static const appOrange = Color(0xFFFD9468);
  static const appYellow = Color(0xFFFFD250);
  static const appGreen = Color(0xFF6FD7A3);
}
