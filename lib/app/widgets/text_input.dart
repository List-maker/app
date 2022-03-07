import 'package:flutter/widgets.dart';
import 'package:list/app/widgets/morph-out.dart';
import 'package:list/core/extensions/size.dart';

class TextInput extends StatelessWidget {
  const TextInput({Key? key, required this.text}) : super(key: key);

  final text;

  @override
  Widget build(BuildContext context) {
    return MorphOut(
      child: Container(
        height: 6.0.hp,
        width: 70.0.wp,
      ),
    );
  }
}
