import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:list/style/theme.dart';

class MorphOut extends StatelessWidget {
  const MorphOut({Key? key, required this.child, this.decorationOverride}) : super(key: key);
  final Decoration? decorationOverride;
  final Widget child;

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: decorationOverride == null ? morphOut : decorationOverride,
      child: child,
    );
  }
}
