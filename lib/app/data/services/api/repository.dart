import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../../providers/api.dart';

class AuthRepository {
  ApiProvider apiProvider = ApiProvider()..onInit();

  Future<Response<dynamic>> login(String login, String password) =>
      apiProvider.request(
        'auth/login',
        'POST',
        query: <String, String>{'login': login, 'password': password},
      );

  Future<Response<dynamic>> register(
    String username,
    String email,
    String password,
  ) =>
      apiProvider.request(
        'auth/register',
        'POST',
        query: <String, String>{
          'username': username,
          'email': email,
          'password': password
        },
      );
}
