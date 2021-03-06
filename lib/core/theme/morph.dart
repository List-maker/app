import 'package:flutter/widgets.dart';

import 'gradients.dart';

final morphOut = BoxDecoration(
  gradient: grayIn,
  borderRadius: BorderRadius.circular(15),
  boxShadow: [
    BoxShadow(
      color: Color(0x26000000),
      blurRadius: 6,
      offset: Offset(2, 2),
    ),
    BoxShadow(
      color: Color(0x73FFFFFF),
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
      Color(0xFFA9A9B3),
      Color(0xFFC7C7D0),
    ],
  ),
  borderRadius: BorderRadius.circular(7),
);

final morphIn2 = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Color(0xDDD9D7E3),
      blurRadius: 6,
      spreadRadius: 11,
    ),
  ],
  borderRadius: BorderRadius.circular(7),
);
