import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/colors.dart';
import '../../data/services/api/auth_service.dart';
import 'state.dart';

class RegisterController extends GetxController
    with GetTickerProviderStateMixin {
  final AuthServices _authServices = AuthServices();
  RegisterState state = RegisterState();

  Future<void> onSubmit() async {
    if (state.usernameKey.currentState!.validate() &&
        state.emailKey.currentState!.validate() &&
        state.passwordKey.currentState!.validate() &&
        state.confirmPasswordKey.currentState!.validate()) {
      final MapEntry<int, String?> res = await _authServices.register(
          state.usernameController.text,
          state.emailController.text,
          state.passwordController.text);
      if (res.key == 200) {
        log('IS CONNECTED !!!!!');
      } else {
        log(res.value!);
      }
    }
  }

  @override
  void onInit() {
    state.usernameFocus = FocusNode();
    state.usernameAnimationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    state.usernameHintTextColor = ColorTween(begin: white, end: error).animate(
      CurvedAnimation(
        parent: state.usernameAnimationController,
        curve: Curves.easeInOutQuart,
        reverseCurve: Curves.easeInOutQuart,
      ),
    )..addStatusListener(
        (AnimationStatus status) {
          if (status == AnimationStatus.completed) {
            state.usernameAnimationController.reverse();
          }
        },
      );

    state.emailFocus = FocusNode();
    state.emailAnimationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    state.emailHintTextColor = ColorTween(begin: white, end: error).animate(
      CurvedAnimation(
        parent: state.emailAnimationController,
        curve: Curves.easeInOutQuart,
        reverseCurve: Curves.easeInOutQuart,
      ),
    )..addStatusListener(
        (AnimationStatus status) {
          if (status == AnimationStatus.completed) {
            state.emailAnimationController.reverse();
          }
        },
      );

    state.passwordFocus = FocusNode();
    state.passwordAnimationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
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

    state.confirmPasswordFocus = FocusNode();
    state.confirmPasswordAnimationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    state.confirmPasswordHintTextColor =
        ColorTween(begin: white, end: error).animate(
      CurvedAnimation(
        parent: state.confirmPasswordAnimationController,
        curve: Curves.easeInOutQuart,
        reverseCurve: Curves.easeInOutQuart,
      ),
    )..addStatusListener(
            (AnimationStatus status) {
              if (status == AnimationStatus.completed) {
                state.confirmPasswordAnimationController.reverse();
              }
            },
          );

    super.onInit();
  }

  @override
  void onClose() {
    state.usernameFocus.dispose();
    state.usernameController.dispose();
    state.usernameAnimationController.dispose();

    state.emailFocus.dispose();
    state.emailController.dispose();
    state.emailAnimationController.dispose();

    state.passwordFocus.dispose();
    state.passwordController.dispose();
    state.passwordAnimationController.dispose();

    state.confirmPasswordFocus.dispose();
    state.confirmPasswordController.dispose();
    state.confirmPasswordAnimationController.dispose();

    super.onClose();
  }
}
