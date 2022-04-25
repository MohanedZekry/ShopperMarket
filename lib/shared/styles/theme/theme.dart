import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/shared/styles/colors.dart';
import '../dimens.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: darkModeDarkerColor,
  fontFamily: "TheSans",
  primarySwatch: Colors.blue,
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    backgroundColor: darkModeColor,
    backwardsCompatibility: false,
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: Dimens.sTitle,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: darkModeColor,
      statusBarIconBrightness: Brightness.light,
    )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: backgroundColorDark,
    selectedItemColor: primarySwatchColor,
    unselectedItemColor: Colors.grey,
    type: BottomNavigationBarType.fixed,
    elevation: 20.0,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
      fontSize: Dimens.sBody1,
    )
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
);
ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: backgroundColorLight,
    primarySwatch: Colors.blue,
    fontFamily: "TheSans",
    appBarTheme: const AppBarTheme(
        elevation: 0.0,
        backgroundColor: Colors.white,
        backwardsCompatibility: false,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: Dimens.sTitle,
          fontWeight: FontWeight.bold,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: primarySwatchColor,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      elevation: 20.0,
    ),
    textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: Colors.black,
          fontSize: Dimens.sBody1,
        )
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    )
);