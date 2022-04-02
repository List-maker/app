import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/texts.dart';

class LoginState {
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
  late FocusNode loginFocus, passwordFocus;
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late Animation<Color?> loginHintTextColor, passwordHintTextColor;
  late AnimationController loginAnimationController,
      passwordAnimationController;
  late InputDecoration loginDecoration = inputDecoration.copyWith(
    hintText: 'LOGIN__login_hintText'.tr,
  );
  late InputDecoration passwordDecoration = inputDecoration.copyWith(
    hintText: 'LOGIN__password_hintText'.tr,
  );
}
