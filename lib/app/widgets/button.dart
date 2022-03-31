import 'package:flutter/material.dart';
import 'package:list/core/extensions/number.dart';
import 'package:list/core/theme/gradients.dart';
import 'package:list/core/theme/morph.dart';

import 'morph_out.dart';

class Button extends StatelessWidget {
  Button({
    Key? key,
    required this.text,
    required this.onTap,
    this.secondTheme = false,
  }) : super(key: key);

  final String text;
  final void Function() onTap;
  final bool secondTheme;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 5.4.hp,
        width: 46.3.wp,
        child: MorphOut(
          decorationOverride: morphOut.copyWith(
            gradient: secondTheme ? grayOut : primaryOut,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: secondTheme ? Color(0x41000000) : Color(0x730A082F),
                blurRadius: 8,
                offset: Offset(2, 2),
              ),
              BoxShadow(
                color: secondTheme ? Color(0xC0FFFFFF) : Color(0xFFDDDAFF),
                blurRadius: 8,
                offset: Offset(-2, -2),
              ),
            ],
          ),
          child: Center(
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
