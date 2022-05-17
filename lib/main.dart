import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/modules/splash_screen/binding.dart';
import 'core/internationalization/translations.dart';
import 'core/routes/app_pages.dart';
import 'core/routes/app_routes.dart';
import 'core/theme/themes.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Messages(),
      theme: primaryTheme,
      title: 'List',
      locale: Get.deviceLocale,
      initialBinding: SplashScreenBinding(),
      initialRoute: Routes.SPLASH_SCREEN,
      getPages: AppPages().pages,
      fallbackLocale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
    );
  }
}
