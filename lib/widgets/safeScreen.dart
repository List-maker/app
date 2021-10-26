import 'package:flutter/material.dart';
import 'package:list/style/theme.dart';

class SafeScreen extends StatelessWidget {
  const SafeScreen({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeList.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.90,
            child: child,
          ),
        ),
      ),
    );
  }
}
