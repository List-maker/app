import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:list/app/modules/login/binding.dart';
import 'package:list/core/internationalization/translations.dart';
import 'package:list/core/routes/app_pages.dart';
import 'package:list/core/routes/app_routes.dart';
import 'package:list/core/theme/themes.dart';

void main() async {
  await GetStorage.init();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Messages(),
      theme: primaryTheme,
      title: 'Material App',
      locale: Get.deviceLocale,
      initialBinding: LoginBinding(),
      initialRoute: Routes.LOGIN,
      getPages: AppPages.pages,
      fallbackLocale: Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
    );
  }
}
