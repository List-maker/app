import 'package:flutter/widgets.dart';
import 'package:list/core/extensions/number.dart';
import 'package:list/core/theme/morph.dart';

class MorphIn extends StatelessWidget {
  const MorphIn({
    Key? key,
    required this.child,
    this.decoration1Override,
    this.decoration2Override,
  }) : super(key: key);
  final Decoration? decoration1Override;
  final Decoration? decoration2Override;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: decoration1Override ?? morphIn1,
          padding: EdgeInsets.fromLTRB(3.6.wp, 3.4.wp, 3.4.wp, 3.2.wp),
          child: Center(
            child: Container(
              decoration: decoration2Override ?? morphIn2,
            ),
          ),
        ),
        Center(child: child),
      ],
    );
  }
}
