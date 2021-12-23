import 'package:flutter/material.dart';
import 'package:list/style/theme.dart';

import 'morphOut.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, required this.text, required this.onTap})
      : super(key: key);
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: MorphOut(
        decorationOverride: morphOut.copyWith(
          gradient: primaryOut,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, .45),
              blurRadius: 8,
              offset: Offset(2, 2),
            ),
            BoxShadow(
              color: Color.fromRGBO(255, 255, 255, 1),
              blurRadius: 8,
              offset: Offset(-2, -2),
            ),
          ],
        ),
        child: Container(
          height: 50,
          width: 200,
          child: Center(
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
