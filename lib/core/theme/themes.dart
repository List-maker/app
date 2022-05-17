import 'package:flutter/material.dart';

import 'colors.dart';

final ThemeData primaryTheme = ThemeData(
  primaryColor: primary,
  backgroundColor: background,
  textTheme: const TextTheme(
    bodyText2: TextStyle(
        color: white,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w800,
        fontSize: 20),
    headline1: TextStyle(
        color: primary,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w800,
        fontSize: 40),
    headline2: TextStyle(
        color: primary,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w800,
        fontSize: 28),
    labelMedium: TextStyle(
        color: primary,
        fontFamily: 'Poppins',
        fontSize: 15,
        fontWeight: FontWeight.w600),
  ),
  fontFamily: 'Poppins',
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: primary,
    selectionColor: primarySelection,
    selectionHandleColor: primary,
  ),
);
