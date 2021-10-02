import 'package:flutter/material.dart';
import 'package:list/style/theme.dart';

class MorphOut extends StatelessWidget {
  MorphOut({
    required this.child,
    required this.exept,
  });

  final Widget child;
  final Object exept;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: morphOut.copyWith(

      ),
      child: child,
    );
  }
}
