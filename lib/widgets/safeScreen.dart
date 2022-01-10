import 'package:flutter/material.dart';
import 'package:list/style/theme.dart';

class SafeScreen extends StatelessWidget {
  const SafeScreen({Key? key, required this.child, this.title})
      : super(key: key);
  final Widget child;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(gradient: grayIn),
        child: SafeArea(
          child: Center(
            child: Container(
                child: title != null
                    ? Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.90,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                title!,
                                style: TextStyle(
                                  fontSize: 28,
                                  color: primary,
                                ),
                              ),
                            ),
                          ),
                          Expanded(child: child)
                        ],
                      )
                    : child),
          ),
        ),
      ),
    );
  }
}
