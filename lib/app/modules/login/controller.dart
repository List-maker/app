import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/colors.dart';
import '../../data/services/api/auth/auth_service.dart';
import 'state.dart';

class LoginController extends GetxController with GetTickerProviderStateMixin {
  AuthServices authServices = AuthServices();
  LoginState state = LoginState();

  Future<void> onSubmit() async {
    if (state.loginKey.currentState!.validate() &&
        state.passwordKey.currentState!.validate()) {
      final MapEntry<int, String?> res = await authServices.login(
          state.loginController.text, state.passwordController.text);
      if (res.key == 200) {
        log('IS CONNECTED !!!!!');
      } else {
        log(res.value!);
      }
    }
  }

  @override
  void onInit() {
    state.loginAnimationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    state.passwordAnimationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);

    state.loginHintTextColor = ColorTween(begin: white, end: error).animate(
      CurvedAnimation(
        parent: state.loginAnimationController,
        curve: Curves.easeInOutQuart,
        reverseCurve: Curves.easeInOutQuart,
      ),
    )..addStatusListener(
        (AnimationStatus status) {
          if (status == AnimationStatus.completed) {
            state.loginAnimationController.reverse();
          }
        },
      );
    state.passwordHintTextColor = ColorTween(begin: white, end: error).animate(
      CurvedAnimation(
        parent: state.passwordAnimationController,
        curve: Curves.easeInOutQuart,
        reverseCurve: Curves.easeInOutQuart,
      ),
    )..addStatusListener(
        (AnimationStatus status) {
          if (status == AnimationStatus.completed) {
            state.passwordAnimationController.reverse();
          }
        },
      );

    state.loginFocus = FocusNode();
    state.passwordFocus = FocusNode();
    super.onInit();
  }

  @override
  void onClose() {
    state.loginFocus.dispose();
    state.passwordFocus.dispose();
    state.loginController.dispose();
    state.passwordController.dispose();
    state.loginAnimationController.dispose();
    super.onClose();
  }
}
