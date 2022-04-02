import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../core/extensions/number.dart';
import '../../../core/routes/app_routes.dart';
import '../../widgets/button.dart';
import '../../widgets/safe_screen.dart';
import '../../widgets/text_input.dart';
import 'controller.dart';
import 'state.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginState state = controller.state;
    return SafeScreen(
      title: 'LOGIN'.tr,
      child: AutofillGroup(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 15.6.hp,
            ),
            Form(
              key: state.loginKey,
              child: TextInput(
                autocorrect: false,
                autofillHints: const <String>[
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
                  return null;
                },
                decoration: state.loginDecoration,
                hintTextColor: state.loginHintTextColor,
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    state.loginFocus.requestFocus();
                    state.loginAnimationController.forward();
                    return '';
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
                autofillHints: const <String>[
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
                  return null;
                },
                decoration: state.passwordDecoration,
                hintTextColor: state.passwordHintTextColor,
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    state.passwordFocus.requestFocus();
                    state.passwordAnimationController.forward();
                    return '';
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
            const Spacer(),
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
