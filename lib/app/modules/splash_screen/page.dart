import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../core/extensions/number.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/icons.dart';
import '../../../core/theme/morph.dart';
import '../../widgets/morph_out.dart';
import '../../widgets/safe_screen.dart';
import 'controller.dart';
import 'state.dart';

class SplashScreenPage extends GetView<SplashScreenController> {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SplashScreenState state = controller.state;
    return SafeScreen(
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 12.0.hp,
            ),
            MorphOut(
              decorationOverride: morphOut.copyWith(
                  borderRadius: BorderRadius.circular(26),
                  boxShadow: <BoxShadow>[
                    const BoxShadow(
                      color: Color(0x37000000),
                      blurRadius: 20,
                      offset: Offset(15, 15),
                    ),
                    const BoxShadow(
                      color: Color(0xB0FFFFFF),
                      blurRadius: 20,
                      offset: Offset(-15, -15),
                    ),
                  ]),
              child: Icon(
                IcList.check_checked,
                color: primary,
                size: 20.0.hp,
              ),
            ),
            SizedBox(
              height: 5.0.hp,
            ),
            Text(
              'List',
              style: Get.textTheme.headline1?.copyWith(color: white),
            ),
            SizedBox(
              height: 40.0.hp,
            ),
            Text(
              'made by @RaphaelArabeyre',
              style: Get.textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}
