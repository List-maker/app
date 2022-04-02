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
              height: 15.6.hp,
            ),
            Form(
              key: state.usernameKey,
              child: TextInput(
                autocorrect: false,
                autofillHints: const <String>[AutofillHints.username],
                autofocus: true,
                textEditingController: state.usernameController,
                focusNode: state.usernameFocus,
                onFieldSubmitted: (String? value) {
                  if (!state.usernameKey.currentState!.validate()) {
                    state.usernameFocus.requestFocus();
                  } else {
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
            // TextInput(
            //   hintText: 'REGISTER__email_hintText'.tr,
            // ),
            SizedBox(
              height: 2.0.hp,
            ),
            // TextInput(
            //   hintText: 'REGISTER__password_hintText'.tr,
            // ),
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
