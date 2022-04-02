import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../app/modules/login/binding.dart';
import '../../app/modules/login/page.dart';
import '../../app/modules/register/binding.dart';
import '../../app/modules/register/page.dart';
import 'app_routes.dart';

class AppPages {
  final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage<dynamic>(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage<dynamic>(
      name: Routes.REGISTER,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
  ];
}
