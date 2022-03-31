import 'package:flutter/widgets.dart';
import 'package:list/core/theme/morph.dart';

class MorphOut extends StatelessWidget {
  MorphOut({
    Key? key,
    required this.child,
    this.decorationOverride,
  }) : super(key: key);

  final Decoration? decorationOverride;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decorationOverride ?? morphOut,
      child: child,
    );
  }
}
