import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../core/extensions/number.dart';
import '../../../core/routes/app_routes.dart';
import '../../widgets/button.dart';
import '../../widgets/safe_screen.dart';
import '../../widgets/text_input.dart';
import 'controller.dart';
import 'state.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegisterState state = controller.state;

    return SafeScreen(
      title: 'REGISTER'.tr,
      child: AutofillGroup(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10.6.hp,
            ),
            Form(
              key: state.usernameKey,
              child: TextInput(
                autocorrect: false,
                autofillHints: const <String>[AutofillHints.username],
                focusNode: state.usernameFocus,
                autofocus: true,
                textEditingController: state.usernameController,
                onFieldSubmitted: (String? value) {
                  if (state.usernameKey.currentState!.validate()) {
                    state.emailFocus.requestFocus();
                  }
                  return null;
                },
                decoration: state.usernameDecoration,
                hintTextColor: state.usernameHintTextColor,
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    state.usernameFocus.requestFocus();
                    state.usernameAnimationController.forward();
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
              key: state.emailKey,
              child: TextInput(
                autocorrect: false,
                autofillHints: const <String>[AutofillHints.email],
                textEditingController: state.emailController,
                focusNode: state.emailFocus,
                onFieldSubmitted: (String? value) {
                  if (state.emailKey.currentState!.validate()) {
                    state.passwordFocus.requestFocus();
                  }
                  return null;
                },
                decoration: state.emailDecoration,
                hintTextColor: state.emailHintTextColor,
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    state.emailFocus.requestFocus();
                    state.emailAnimationController.forward();
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
                autofillHints: const <String>[AutofillHints.password],
                textEditingController: state.passwordController,
                focusNode: state.passwordFocus,
                onFieldSubmitted: (String? value) {
                  if (state.passwordKey.currentState!.validate()) {
                    state.confirmPasswordFocus.requestFocus();
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
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 2.0.hp,
            ),
            Form(
              key: state.confirmPasswordKey,
              child: TextInput(
                autocorrect: false,
                autofillHints: const <String>[AutofillHints.password],
                textEditingController: state.confirmPasswordController,
                focusNode: state.confirmPasswordFocus,
                onFieldSubmitted: (String? value) {
                  if (state.confirmPasswordKey.currentState!.validate()) {
                    controller.onSubmit();
                  }
                  return null;
                },
                decoration: state.confirmPasswordDecoration,
                hintTextColor: state.confirmPasswordHintTextColor,
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    state.confirmPasswordFocus.requestFocus();
                    state.confirmPasswordAnimationController.forward();
                    return '';
                  } else if (value != null &&
                      value != state.passwordController.text) {
                    state.confirmPasswordFocus.requestFocus();
                    //Todo : manage not same password error here
                    return '';
                  }
                  return null;
                },
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 4.0.hp,
            ),
            Button(
              text: 'REGISTER'.tr,
              onTap: () {},
            ),
            const Spacer(),
            Text('REGISTER__already_account'.tr),
            SizedBox(
              height: 2.0.hp,
            ),
            Button(
              text: 'LOGIN'.tr,
              onTap: () {
                Get.offNamed(Routes.LOGIN);
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
