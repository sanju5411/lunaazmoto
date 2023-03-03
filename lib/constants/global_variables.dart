import 'package:flutter/material.dart';

class CustomColor {
  static const primaryColor = Color.fromRGBO(130, 0, 0, 1);
  static const primaryDarkColor = Color.fromRGBO(107, 0, 0, 1.0);
  static const secondaryColor = Color.fromRGBO(191, 89, 61, 1);
  static const secondaryDarkColor = Color.fromRGBO(110, 52, 34, 1.0);
  static const accentColor = Color.fromRGBO(224, 211, 45, 1.0);
  static const backgroundLightColor = Color.fromRGBO(250, 236, 214, 1);
  static const backgroundDarkColor = Color.fromRGBO(194, 185, 164, 1.0);
  static const backgroundActiveColor = Color.fromRGBO(129, 217, 111, 1.0);
  static const backgroundPauseColor = Color.fromRGBO(224, 147, 48, 1.0);
  static const booknowbtnColor = Color.fromRGBO(78, 108, 80, 1);

  static const successColor = Color.fromRGBO(91, 178, 39, 1.0);

  static const whiteColor = Color.fromRGBO(255, 255, 255, 1.0);
  static const errorColor = Color.fromRGBO(222, 24, 24, 1.0);

  static const primaryTextColor = Color.fromRGBO(31, 31, 31, 1.0);
  static const secondaryTextColor = Color.fromRGBO(105, 105, 105, 1.0);

  static const primaryDividerColor = Color.fromRGBO(65, 65, 65, 1.0);
  static const secondaryDividerColor = Color.fromRGBO(169, 169, 169, 1.0);
}

class CustomStyle {
  static const TextStyle appTitleTextStyle = TextStyle(
    color: CustomColor.primaryTextColor,
    fontWeight: FontWeight.w600,
    fontSize: 24,
  );
  static const TextStyle headingTextStyle = TextStyle(
    color: CustomColor.primaryColor,
    fontWeight: FontWeight.w800,
    fontSize: 24,
  );

  static const TextStyle displayTextStyle = TextStyle(
    color: CustomColor.primaryTextColor,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );
  static const TextStyle darkTextStyle = TextStyle(
    color: Colors.black87,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  static const TextStyle primaryTextStyle = TextStyle(
    color: CustomColor.primaryColor,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  static const TextStyle secondaryTextStyle = TextStyle(
    color: CustomColor.secondaryTextColor,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
  static const TextStyle errorTextStyle = TextStyle(
    color: CustomColor.errorColor,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
  static const TextStyle successTextStyle = TextStyle(
    color: CustomColor.successColor,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
}
