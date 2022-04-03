import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/texts.dart';

class RegisterState {
  final GlobalKey<FormState> usernameKey = GlobalKey<FormState>();
  late FocusNode usernameFocus;
  final TextEditingController usernameController = TextEditingController();
  late Animation<Color?> usernameHintTextColor;
  late AnimationController usernameAnimationController;
  late InputDecoration usernameDecoration = inputDecoration.copyWith(
    hintText: 'REGISTER__username_hintText'.tr,
  );

  final GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  late FocusNode emailFocus;
  final TextEditingController emailController = TextEditingController();
  late Animation<Color?> emailHintTextColor;
  late AnimationController emailAnimationController;
  late InputDecoration emailDecoration = inputDecoration.copyWith(
    hintText: 'REGISTER__email_hintText'.tr,
  );

  final GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
  late FocusNode passwordFocus;
  final TextEditingController passwordController = TextEditingController();
  late Animation<Color?> passwordHintTextColor;
  late AnimationController passwordAnimationController;
  late InputDecoration passwordDecoration = inputDecoration.copyWith(
    hintText: 'REGISTER__password_hintText'.tr,
  );

  final GlobalKey<FormState> confirmPasswordKey = GlobalKey<FormState>();
  late FocusNode confirmPasswordFocus;
  final TextEditingController confirmPasswordController =
      TextEditingController();
  late Animation<Color?> confirmPasswordHintTextColor;
  late AnimationController confirmPasswordAnimationController;
  late InputDecoration confirmPasswordDecoration = inputDecoration.copyWith(
    hintText: 'REGISTER__confirm_password_hintText'.tr,
  );
}
