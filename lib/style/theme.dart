import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

final themeList = ThemeData(
  primaryColor: Color.fromRGBO(72, 47, 247, 1),
  backgroundColor: Color.fromRGBO(217, 215, 227, 1),
  textTheme: TextTheme(
    bodyText2: TextStyle(
        color: Colors.white,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w800,
        fontSize: 20),
    headline1: TextStyle(
        color: Color.fromRGBO(72, 47, 247, 1),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w800,
        fontSize: 30),
  ),
  fontFamily: 'Poppins',
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Color.fromRGBO(72, 47, 247, 1),
    selectionColor: Color.fromRGBO(72, 47, 247, 0.2),
    selectionHandleColor: Color.fromRGBO(72, 47, 247, 1),
  ),
);

const whiteText = Colors.white;

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
      blurRadius: 8,
      offset: Offset(2, 2),
    ),
    BoxShadow(
      color: Color.fromRGBO(255, 255, 255, .45),
      blurRadius: 8,
      offset: Offset(-2, -2),
    ),
  ],
);

const inputDecoration = InputDecoration(
  hintStyle: TextStyle(
    color: whiteText,
    fontWeight: FontWeight.bold,
  ),
  border: InputBorder.none,
  focusColor: Color.fromRGBO(72, 47, 247, 1),
  hoverColor: Color.fromRGBO(72, 47, 247, 1),
);

final inputStyle = TextStyle(
  color: themeList.primaryColor,
  fontWeight: FontWeight.bold,
);
