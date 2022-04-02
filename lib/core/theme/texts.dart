import 'package:flutter/material.dart';

import 'colors.dart';

const TextStyle inputStyle = TextStyle(
  color: primary,
  fontWeight: FontWeight.bold,
  fontSize: 18,
  height: 1.25,
);

const InputDecoration inputDecoration = InputDecoration(
  hintStyle: TextStyle(
    color: white,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  ),
  border: InputBorder.none,
  focusColor: primary,
  hoverColor: primary,
  errorStyle: TextStyle(height: 0),
);
