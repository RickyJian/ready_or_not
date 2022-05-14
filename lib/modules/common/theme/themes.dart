import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// Theme store app themes
///  * light: https://www.color-hex.com/color-palette/14231
///           https://paletton.com/#uid=30T0u0k3evf05Wz1bHs67qLa2mH
// TODO: add dark theme
class Themes {
  Themes._();

  /// common private constant
  static const _appBarTextSize = 16;

  /// common constant
  static const String fontFamily = 'openhuninn';
  static const double textSize = 14;

  /// light theme
  static const lightPrimaryColor = Color.fromRGBO(181, 156, 124, 1);
  static const lightBackgroundColor = Color.fromRGBO(251, 249, 234, 1);
  static const lightBackgroundSecondaryColor = Color.fromRGBO(219, 246, 233, 1);
  static const lightNavBackgroundColor = Colors.white;

  /// light label and text
  static const lightTextColor = lightPrimaryColor;
  static const lightTextSecondaryColor = Color.fromRGBO(195, 796, 149, 1);
  static const lightTextBorderColor = lightPrimaryColor;
  static const lightTextFocusedBorderColor = Color.fromARGB(181, 156, 124, 1);
  static const lightIconColor = lightPrimaryColor;
  static const textStyle = TextStyle(
    color: lightTextColor,
    fontFamily: fontFamily,
  );

  static final light = ThemeData.light().copyWith(
    primaryColor: lightPrimaryColor,
    scaffoldBackgroundColor: lightBackgroundColor,
    unselectedWidgetColor: lightPrimaryColor,
    toggleableActiveColor: lightPrimaryColor,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: lightTextColor,
        fontFamily: fontFamily,
        fontSize: _appBarTextSize.sp,
      ),
      color: lightNavBackgroundColor,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: lightNavBackgroundColor,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: lightPrimaryColor,
    ),
    textTheme: const TextTheme(
      subtitle1: textStyle,
      subtitle2: textStyle,
      bodyText1: textStyle,
      bodyText2: textStyle,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: lightTextBorderColor,
        ),
      ),
      focusColor: Colors.black,
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: lightTextFocusedBorderColor,
          width: 2,
        ),
      ),
      helperStyle: textStyle,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: textStyle,
        primary: lightTextColor,
      ),
    ),
    iconTheme: const IconThemeData(
      color: lightIconColor,
    ),
  );

  static final dark = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        fontFamily: fontFamily,
      ),
    ),
    textTheme: TextTheme(
      bodyText2: TextStyle(
        fontFamily: fontFamily,
      ),
    ),
  );
}
