import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:list/style/theme.dart';

class MorphIn extends StatelessWidget {
  const MorphIn(
      {Key? key,
      required this.child,
      this.decoration1Override,
      this.decoration2Override})
      : super(key: key);
  final Decoration? decoration1Override;
  final Decoration? decoration2Override;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: decoration1Override == null ? morphIn1 : decoration1Override,
      child: Container(
        alignment: Alignment.centerLeft,
        decoration:
            decoration2Override == null ? morphIn2 : decoration2Override,
        child: child,
      ),
    );
  }
}
