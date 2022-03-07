import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:list/app/widgets/morph-out.dart';
import 'package:list/app/widgets/safe_screen.dart';
import 'package:list/app/widgets/text_input.dart';

import 'controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return SafeScreen(
        title: "Login",
        child: Column(
          children: [
            Spacer(),
            TextInput(),
            SizedBox(
              height: 30,
            ),
            MorphOut(
                child: Container(
              height: 30,
              width: 90,
            )),
            Spacer(),
          ],
        ));
  }
}
