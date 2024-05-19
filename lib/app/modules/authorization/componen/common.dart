import 'package:flutter/material.dart';

import '../../../componen/color.dart';

class Common {
  Color maincolor = const Color(0xFF35C2C1);
  Color white = const Color(0xFFF5F5F5);
  Color black = const Color(0xFF2B407D);

  TextStyle titelTheme =  TextStyle(
      fontSize: 30,
      fontFamily: "Urbanist",
      fontWeight: FontWeight.bold,
      color: MyColors.appPrimaryColor);
  TextStyle mediumTheme = const TextStyle(
      fontSize: 15,
      fontFamily: "Urbanist-Bold",
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 72, 151, 151));
  TextStyle mediumThemeblack = const TextStyle(
      fontSize: 16,
      fontFamily: "Urbanist-Bold",
      fontWeight: FontWeight.w300,
      color: Colors.grey);
  TextStyle semiboldwhite = const TextStyle(
      fontSize: 15,
      fontFamily: "nunito",
      fontWeight: FontWeight.bold,
      color: Colors.white);
  TextStyle semiboldblue = TextStyle(
      fontSize: 15,
      fontFamily: "nunito",
      fontWeight: FontWeight.bold,
      color: MyColors.appPrimaryColor);
  TextStyle semiboldblack = const TextStyle(
      fontSize: 15, fontFamily: "Urbanist-SemiBold", color: Colors.grey);
  TextStyle hinttext = const TextStyle(
      fontSize: 15, fontFamily: 'Urbanist-Medium', color: Color(0xFF8391A1));
}