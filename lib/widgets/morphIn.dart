import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:list/style/theme.dart';

class MorphIn extends StatelessWidget {
  const MorphIn({Key? key, required this.child, this.decorationOverride})
      : super(key: key);
  final Decoration? decorationOverride;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        decoration: BoxDecoration(),
        child: Container(
          decoration: BoxDecoration(gradient: grayIn),
          child: child,
        ),
      ),
    );
  }
}
