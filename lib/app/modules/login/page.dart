import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:list/app/widgets/button.dart';
import 'package:list/app/widgets/safe_screen.dart';
import 'package:list/app/widgets/text_input.dart';
import 'package:list/core/extensions/number.dart';
import 'package:list/core/routes/app_routes.dart';

import 'controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final state = controller.state;
    return SafeScreen(
      title: 'LOGIN'.tr,
      child: AutofillGroup(
        child: Column(
          children: [
            SizedBox(
              height: 15.6.hp,
            ),
            Form(
              key: state.loginKey,
              child: TextInput(
                autocorrect: false,
                autofillHints: const [
                  AutofillHints.username,
                  AutofillHints.email
                ],
                autofocus: true,
                textEditingController: state.loginController,
                focusNode: state.loginFocus,
                onFieldSubmitted: (String? value) {
                  if (!state.loginKey.currentState!.validate()) {
                    state.loginFocus.requestFocus();
                  } else {
                    state.passwordFocus.requestFocus();
                  }
                },
                decoration: state.loginDecoration,
                hintTextColor: state.loginHintTextColor,
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    state.loginFocus.requestFocus();
                    state.loginAnimationController.forward();
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
              key: state.passwordKey,
              child: TextInput(
                autocorrect: false,
                autofillHints: const [
                  AutofillHints.password,
                ],
                obscureText: true,
                autofocus: true,
                textEditingController: state.passwordController,
                focusNode: state.passwordFocus,
                onFieldSubmitted: (String? value) {
                  if (!state.passwordKey.currentState!.validate()) {
                    state.passwordFocus.requestFocus();
                  } else {
                    controller.onSubmit();
                  }
                },
                decoration: state.passwordDecoration,
                hintTextColor: state.passwordHintTextColor,
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    state.passwordFocus.requestFocus();
                    state.passwordAnimationController.forward();
                    return "";
                  }
                  return null;
                },
                keyboardType: TextInputType.visiblePassword,
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
              secondTheme: true,
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
