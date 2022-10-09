import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// Theme store app themes
///   * light:
///     primary:
///     primary font color: https://www.colorhexa.com/b59c7c
///     secondary font color: https://www.colorhexa.com/c3b395
///     positive color: https://www.colorhexa.com/20d41c
///     negative color: https://www.colorhexa.com/ff1a2e
///     secondary background:
///     primary background: https://www.colorhexa.com/fbf9ea
///     pallet: https://paletton.com/#uid=30T0u0k3evf05Wz1bHs67qLa2mH
// TODO: add dark theme
class Themes {
  Themes._();

  // TODO: current theme

  /// common private constant
  static const _appBarTextSize = 16;

  /// common constant
  static const String fontFamily = 'openhuninn';

  /// light theme
  static const lightPrimaryColor = Color.fromRGBO(181, 156, 124, 1);
  static const lightPrimaryColor200 = Color.fromRGBO(181, 156, 124, 0.2);
  static const lightBackgroundColor = Color.fromRGBO(251, 249, 234, 1);
  static const lightBackgroundSecondaryColor = Color.fromRGBO(219, 246, 233, 1);
  static const lightNavBackgroundColor = Colors.white;

  /// light label and text
  static const lightTextColor = lightPrimaryColor;
  static const lightTextSecondaryColor = Color.fromRGBO(195, 179, 149, 1);
  static const lightPositiveColor = Color.fromRGBO(48, 203, 139, 1);
  static const lightNegativeColor = Color.fromRGBO(255, 26, 46, 1);
  static final lightHintTextColor = lightPrimaryColor.withOpacity(0.6);
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
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: lightTextBorderColor,
        ),
      ),
      hintStyle: TextStyle(
        color: lightHintTextColor,
        fontFamily: fontFamily,
      ),
      focusColor: Colors.black,
      focusedBorder: const UnderlineInputBorder(
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
