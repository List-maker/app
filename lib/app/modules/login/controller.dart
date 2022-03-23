import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list/core/theme/texts.dart';

import '../../../core/theme/colors.dart';

class LoginController extends GetxController with GetTickerProviderStateMixin {
  final loginKey = GlobalKey<FormState>();
  final passwordKey = GlobalKey<FormState>();
  late FocusNode loginFocus;
  late FocusNode passwordFocus;
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  late Animation<Color?> loginHintTextColor;
  late AnimationController loginAnimationController;
  late InputDecoration loginDecoration = inputDecoration.copyWith(
    hintText: 'LOGIN__login_hintText'.tr,
  );
  late Animation<Color?> passwordHintTextColor;
  late AnimationController passwordAnimationController;

  late InputDecoration passwordDecoration = inputDecoration.copyWith(
    hintText: 'LOGIN__password_hintText'.tr,
  );

  @override
  void onInit() {
    loginAnimationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    passwordAnimationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);

    loginHintTextColor = ColorTween(begin: white, end: error).animate(
      CurvedAnimation(
        parent: loginAnimationController,
        curve: Curves.easeInOutQuart,
        reverseCurve: Curves.easeInOutQuart,
      ),
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            loginAnimationController.reverse();
          }
        },
      );
    passwordHintTextColor = ColorTween(begin: white, end: error).animate(
      CurvedAnimation(
        parent: passwordAnimationController,
        curve: Curves.easeInOutQuart,
        reverseCurve: Curves.easeInOutQuart,
      ),
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            passwordAnimationController.reverse();
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
    loginAnimationController.dispose();
    super.onClose();
  }
}
