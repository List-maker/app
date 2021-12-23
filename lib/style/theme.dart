import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

final themeList = ThemeData(
  primaryColor: primary,
  backgroundColor: backgroundColor,
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
    selectionColor: darkPrimary,
    selectionHandleColor: primary,
  ),
);

final primary = Color.fromRGBO(72, 47, 247, 1);
final darkPrimary = Color.fromRGBO(72, 47, 247, 0.2);
final backgroundColor = Color.fromRGBO(217, 215, 227, 1);
final whiteText = Color.fromRGBO(255, 255, 255, 1);
final gray = Color.fromRGBO(127, 127, 127, 1.0);

final grayOut = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: <Color>[
    Color.fromRGBO(219, 217, 228, 1),
    Color.fromRGBO(206, 204, 216, 1),
  ],
);

final grayIn = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: <Color>[
    Color.fromRGBO(206, 204, 216, 1),
    Color.fromRGBO(219, 217, 228, 1),
  ],
);
final primaryOut = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: <Color>[
    Color.fromRGBO(63, 41, 217, 1),
    Color.fromRGBO(94, 72, 248, 1),
  ],
);

final primaryIn = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: <Color>[
    Color.fromRGBO(94, 72, 248, 1),
    Color.fromRGBO(63, 41, 217, 1),
  ],
);

final morphOut = BoxDecoration(
  gradient: grayIn,
  borderRadius: BorderRadius.circular(15),
  boxShadow: [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, .15),
      blurRadius: 6,
      offset: Offset(2, 2),
    ),
    BoxShadow(
      color: Color.fromRGBO(255, 255, 255, .45),
      blurRadius: 6,
      offset: Offset(-2, -2),
    ),
  ],
);

final morphIn1 = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Color.fromRGBO(169, 169, 179, 1.0),
      Color.fromRGBO(193, 191, 201, 0.8)
    ],
  ),
  borderRadius: BorderRadius.circular(7),
);

final morphIn2 = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Color.fromRGBO(217, 215, 227, 0.80),
      blurRadius: 6,
      spreadRadius: 12,
    ),
  ],
  borderRadius: BorderRadius.circular(7),
);

final inputDecoration = InputDecoration.collapsed(
  hintStyle: TextStyle(
    color: whiteText,
    fontWeight: FontWeight.bold,
  ),
  border: InputBorder.none,
  focusColor: primary,
  hoverColor: primary,
  hintText: '',
);

final inputStyle = TextStyle(
  color: primary,
  fontWeight: FontWeight.bold,
);
