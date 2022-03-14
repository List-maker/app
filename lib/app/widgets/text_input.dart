import 'package:flutter/material.dart';
import 'package:list/app/widgets/morph-out.dart';
import 'package:list/core/extensions/size.dart';
import 'package:list/core/theme/texts.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    this.style = inputStyle,
    this.decoration,
    this.hintText,
    this.validator,
    this.onFieldSubmitted,
    this.autofillHints,
    this.focusNode,
    this.autofocus = false,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.controller,
    this.initialValue,
  }) : super(key: key);

  final TextStyle style;
  final InputDecoration? decoration;
  final String? hintText;
  final String? Function(String?)? validator;
  final String? Function(String?)? onFieldSubmitted;
  final Iterable<String>? autofillHints;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool enableSuggestions;
  final bool autocorrect;
  final TextEditingController? controller;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return MorphOut(
      child: Container(
        height: 6.0.hp,
        width: 75.0.wp,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
        child: TextFormField(
          style: style,
          decoration: decoration ??
              inputDecoration.copyWith(
                hintText: hintText,
              ),
          validator: validator,
          onFieldSubmitted: onFieldSubmitted,
          autofillHints: autofillHints,
          focusNode: focusNode,
          autofocus: autofocus,
          enableSuggestions: enableSuggestions,
          autocorrect: autocorrect,
          controller: controller,
          initialValue: initialValue,
          cursorHeight: 20,
        ),
      ),
    );
  }
}
