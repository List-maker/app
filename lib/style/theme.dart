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
    Color.fromRGBO(219, 218, 229, 1),
    Color.fromRGBO(202, 200, 212, 1),
  ],
);

final grayIn = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: <Color>[
    Color.fromRGBO(202, 200, 212, 1),
    Color.fromRGBO(219, 218, 229, 1),
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
  gradient: grayOut,
  borderRadius: BorderRadius.circular(15),
  boxShadow: [
    BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.25),
        blurRadius: 7,
        offset: Offset(3, 3)),
    BoxShadow(
        color: Color.fromRGBO(255, 255, 255, 0.61),
        blurRadius: 7,
        offset: Offset(-3, -3)),
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
