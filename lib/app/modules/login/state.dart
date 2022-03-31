import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list/core/theme/texts.dart';

class LoginState {
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
}
