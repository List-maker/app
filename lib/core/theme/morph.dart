import 'package:flutter/widgets.dart';

import 'gradients.dart';

final BoxDecoration morphOut = BoxDecoration(
  gradient: grayIn,
  borderRadius: BorderRadius.circular(15),
  boxShadow: const [
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

final BoxDecoration morphIn1 = BoxDecoration(
  gradient: const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Color(0xFFA9A9B3),
      Color(0xFFC7C7D0),
    ],
  ),
  borderRadius: BorderRadius.circular(7),
);

final BoxDecoration morphIn2 = BoxDecoration(
  boxShadow: const [
    BoxShadow(
      color: Color(0xDDD9D7E3),
      blurRadius: 6,
      spreadRadius: 11,
    ),
  ],
  borderRadius: BorderRadius.circular(7),
);
