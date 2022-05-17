import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/extensions/number.dart';
import '../../core/theme/gradients.dart';

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
        decoration: const BoxDecoration(gradient: grayIn),
        child: SafeArea(
          child: Center(
            child: Container(
                child: title != null
                    ? Column(
                        children: <Widget>[
                          SizedBox(
                            width: 90.0.wp,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child:
                                  Text(title!, style: Get.textTheme.headline2),
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
