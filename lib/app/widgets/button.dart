import 'package:list/core/theme/gradients.dart';
import 'package:list/core/theme/morph.dart';

import 'morph-out.dart';

class Button extends StatelessWidget {
  Button({Key? key, required this.text, required this.onTap}) : super(key: key);

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
              color: Color(0x73000000),
              blurRadius: 8,
              offset: Offset(2, 2),
            ),
            BoxShadow(
              color: Color(0xFFFFFFFF),
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
