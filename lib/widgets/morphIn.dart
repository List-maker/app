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
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.002,
            horizontal: MediaQuery.of(context).size.width * 0.03),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(206, 204, 216, 1),
              blurRadius: 6,
              offset: Offset(2, 2),
            ),
            BoxShadow(
              color: Color.fromRGBO(219, 217, 228, 1),
              blurRadius: 6,
              offset: Offset(-2, -2),
            ),
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          decoration: BoxDecoration(gradient: grayIn),
          child: child,
        ),
      ),
    );
  }
}
