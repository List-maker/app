import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list/core/theme/texts.dart';

class RegisterState {
  final GlobalKey<FormState> usernameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
  late FocusNode usernameFocus, emailFocus, passwordFocus;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late Animation<Color?> usernameHintTextColor;
  late Animation<Color?> emailHintTextColor;
  late AnimationController usernameAnimationController;
  late AnimationController emailAnimationController;
  late InputDecoration usernameDecoration = inputDecoration.copyWith(
    hintText: 'REGISTER__username_hintText'.tr,
  );
  late Animation<Color?> passwordHintTextColor;
  late AnimationController passwordAnimationController;

  late InputDecoration passwordDecoration = inputDecoration.copyWith(
    hintText: 'REGISTER__username_hintText'.tr,
  );
}
