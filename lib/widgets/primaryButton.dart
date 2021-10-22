import 'package:flutter/material.dart';
import 'package:list/style/theme.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, required this.text, required this.onTap}) : super(key: key);
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {

    return InkWell(
        onTap: onTap,
    child: Container(
      height: 50,
      width: 200,
      decoration: morphOut.copyWith(
        gradient: primaryOut,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Text(text),
      ),
      ),
    );
  }
}
