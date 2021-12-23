import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MorphIn extends StatelessWidget {
  const MorphIn({Key? key, required this.child, this.decorationOverride})
      : super(key: key);
  final Decoration? decorationOverride;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Color.fromRGBO(169, 169, 179, 1.0),
            Color.fromRGBO(193, 191, 201, 0.8)
          ],
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(217, 215, 227, 0.80),
              blurRadius: 6,
              spreadRadius: 12,
            ),
          ],
          borderRadius: BorderRadius.circular(7),
        ),
        child: child,
      ),
    );
  }
}
