import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:list/app/widgets/button.dart';
import 'package:list/app/widgets/safe_screen.dart';
import 'package:list/app/widgets/text_input.dart';
import 'package:list/core/extensions/size.dart';
import 'package:list/core/routes/app_routes.dart';

import 'controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return SafeScreen(
      title: 'LOGIN'.tr,
      child: AutofillGroup(
        child: Column(
          children: [
            SizedBox(
              height: 15.6.hp,
            ),
            Form(
              key: controller.loginKey,
              child: TextInput(
                autocorrect: false,
                autofillHints: const [
                  AutofillHints.username,
                  AutofillHints.email
                ],
                autofocus: true,
                textEditingController: controller.loginController,
                focusNode: controller.loginFocus,
                onFieldSubmitted: (String? value) {
                  if (!controller.loginKey.currentState!.validate()) {
                    controller.loginFocus.requestFocus();
                  } else {
                    controller.passwordFocus.requestFocus();
                  }
                },
                decoration: controller.loginDecoration,
                hintTextColor: controller.loginHintTextColor,
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    controller.loginFocus.requestFocus();
                    controller.loginAnimationController.forward();
                    return "";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 2.0.hp,
            ),
            Form(
              key: controller.passwordKey,
              child: TextInput(
                autocorrect: false,
                autofillHints: const [
                  AutofillHints.username,
                  AutofillHints.email
                ],
                autofocus: true,
                textEditingController: controller.passwordController,
                focusNode: controller.passwordFocus,
                onFieldSubmitted: (String? value) {
                  if (!controller.passwordKey.currentState!.validate()) {
                    controller.passwordFocus.requestFocus();
                  } else {
                    controller.onSubmit();
                  }
                },
                decoration: controller.passwordDecoration,
                hintTextColor: controller.passwordHintTextColor,
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    controller.passwordFocus.requestFocus();
                    controller.passwordAnimationController.forward();
                    return "";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 4.0.hp,
            ),
            Button(
              text: 'LOGIN'.tr,
              onTap: () {
                controller.onSubmit();
              },
            ),
            Spacer(),
            Text('LOGIN__no_account'.tr),
            SizedBox(
              height: 2.0.hp,
            ),
            Button(
              text: 'REGISTER'.tr,
              onTap: () {
                Get.offNamed(Routes.REGISTER);
              },
            ),
            SizedBox(
              height: 2.0.hp,
            ),
          ],
        ),
      ),
    );
  }
}
