import 'package:get/get_connect/http/src/response/response.dart';

import '../../providers/api.dart';

class AuthRepository {
  ApiProvider apiProvider = ApiProvider()..onInit();

  Future<Response<dynamic>> login(String login, String password) =>
      apiProvider.get('auth/login',
          query: <String, String>{'login': login, 'password': password});
}
