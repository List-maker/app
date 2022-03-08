import 'package:flutter/material.dart';
import 'package:list/core/theme/colors.dart';

final TextStyle inputStyle = TextStyle(
  color: primary,
  fontWeight: FontWeight.bold,
);

final InputDecoration inputDecoration = InputDecoration.collapsed(
  hintStyle: TextStyle(
    color: whiteText,
    fontWeight: FontWeight.bold,
  ),
  border: InputBorder.none,
  focusColor: primary,
  hoverColor: primary,
  hintText: '',
);
