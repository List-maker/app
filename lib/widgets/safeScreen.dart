import 'package:flutter/material.dart';
import 'package:list/style/theme.dart';
import 'package:list/widgets/pageTitle.dart';

class SafeScreen extends StatelessWidget {
  const SafeScreen({Key? key, required this.child, this.title})
      : super(key: key);
  final Widget child;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeList.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Container(
              width: MediaQuery.of(context).size.width * 0.90,
              child: title != null
                  ? Column(
                      children: [PageTitle(title: title!),Expanded
                        (child: child)],
                    )
                  : child),
        ),
      ),
    );
  }
}
