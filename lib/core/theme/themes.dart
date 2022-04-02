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
        fontSize: 30),
  ),
  fontFamily: 'Poppins',
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: primary,
    selectionColor: primarySelection,
    selectionHandleColor: primary,
  ),
);
