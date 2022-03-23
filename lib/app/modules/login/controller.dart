import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list/core/theme/texts.dart';

import '../../../core/theme/colors.dart';

class LoginController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final loginKey = GlobalKey<FormState>();
  final passwordKey = GlobalKey<FormState>();
  late FocusNode loginFocus;
  late FocusNode passwordFocus;
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  late Animation<Color?> hintTextColor;
  late AnimationController _animationController;
  late InputDecoration decoration = inputDecoration.copyWith(
    hintText: 'LOGIN__login_hintText'.tr,
  );

  errorColor() async {
    _animationController.forward();

    update();
  }

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    hintTextColor =
        ColorTween(begin: white, end: error).animate(_animationController)
          ..addStatusListener(
            (status) {
              if (status == AnimationStatus.completed) {
                _animationController.reverse();
              }
            },
          );

    loginFocus = FocusNode();
    passwordFocus = FocusNode();
    super.onInit();
  }

  @override
  void onClose() {
    loginFocus.dispose();
    passwordFocus.dispose();
    loginController.dispose();
    passwordController.dispose();
    _animationController.dispose();
    super.onClose();
  }
}
