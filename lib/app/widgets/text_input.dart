import 'package:flutter/material.dart';
import 'package:list/app/widgets/morph_out.dart';
import 'package:list/core/extensions/number.dart';
import 'package:list/core/theme/colors.dart';
import 'package:list/core/theme/texts.dart';

class TextInput extends AnimatedWidget {
  TextInput({
    Key? key,
    this.style = inputStyle,
    required this.decoration,
    this.validator,
    this.onFieldSubmitted,
    this.autofillHints,
    this.focusNode,
    this.autofocus = false,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.textEditingController,
    this.initialValue,
    required this.hintTextColor,
    this.keyboardType,
    this.obscureText = false,
  }) : super(key: key, listenable: hintTextColor);

  final TextStyle style;
  final InputDecoration decoration;
  final String? Function(String?)? validator;
  final String? Function(String?)? onFieldSubmitted;
  final Iterable<String>? autofillHints;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool enableSuggestions;
  final bool autocorrect;
  final TextEditingController? textEditingController;
  final String? initialValue;
  final Animation<Color?> hintTextColor;
  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return MorphOut(
      child: Container(
        height: 6.0.hp,
        width: 75.0.wp,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
        child: SizedBox(
          // height: 3.1.hp,
          child: TextFormField(
            style: style,
            decoration: decoration.copyWith(
                hintStyle: TextStyle(color: hintTextColor.value ?? white)),
            validator: validator,
            onFieldSubmitted: onFieldSubmitted,
            autofillHints: autofillHints,
            focusNode: focusNode,
            autofocus: autofocus,
            enableSuggestions: enableSuggestions,
            autocorrect: autocorrect,
            controller: textEditingController,
            initialValue: initialValue,
            cursorHeight: 20,
            keyboardType: keyboardType,
            obscureText: obscureText,
          ),
        ),
      ),
    );
  }
}
