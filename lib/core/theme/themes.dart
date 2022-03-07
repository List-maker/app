import 'package:flutter/material.dart';

import 'colors.dart';

final primaryTheme = ThemeData(
  primaryColor: primary,
  backgroundColor: background,
  textTheme: TextTheme(
    bodyText2: TextStyle(
        color: whiteText,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w800,
        fontSize: 20),
    headline1: TextStyle(
        color: primary,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w800,
        fontSize: 30),
  ),
  fontFamily: 'Poppins',
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: primary,
    selectionColor: primarySelection,
    selectionHandleColor: primary,
  ),
);
