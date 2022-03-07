import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:list/app/modules/login/page.dart';

import '../../app/modules/login/binding.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),

  ];
}