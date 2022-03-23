import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:list/app/widgets/button.dart';
import 'package:list/app/widgets/safe_screen.dart';
import 'package:list/core/extensions/size.dart';
import 'package:list/core/routes/app_routes.dart';

import 'controller.dart';

class RegisterPage extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return SafeScreen(
      title: 'REGISTER'.tr,
      child: AutofillGroup(
        child: Column(
          children: [
            SizedBox(
              height: 15.6.hp,
            ),
            // TextInput(
            //   hintText: 'REGISTER__name_hintText'.tr,
            // ),
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
            Spacer(),
            Text('REGISTER__already_account'.tr),
            SizedBox(
              height: 2.0.hp,
            ),
            Button(
              text: 'LOGIN'.tr,
              onTap: () {
                Get.offNamed(Routes.LOGIN);
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
