import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:list/model/token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config.dart';

Future<void> fetchLogin(String login, String password) async {
  final response = await http.post(
    Uri.parse(apiHost + '/api/auth/login'),
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    },
    encoding: Encoding.getByName('utf-8'),
    body: {
      "login": login,
      "password": password,
    },
  );

  if (response.statusCode == 200) {
    TokenModel token =
        TokenModel.fromJson(await jsonDecode(response.body)['data']);

    final prefs = await SharedPreferences.getInstance();

    prefs.setString('access-token', token.accessToken);
    return;
  } else {
    //TODO: print error
    throw Exception(jsonDecode(response.body)['message']);
  }
}

Future<void> fetchRegister(
    String username, String email, String password) async {
  final response = await http.post(
    Uri.parse(apiHost + '/api/auth/register'),
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    },
    encoding: Encoding.getByName('utf-8'),
    body: {
      "username": username,
      "email": email,
      "password": password,
    },
  );

  if (response.statusCode == 200) {
    TokenModel token =
        TokenModel.fromJson(await jsonDecode(response.body)['data']);

    final prefs = await SharedPreferences.getInstance();

    prefs.setString('access-token', token.accessToken);
  } else {
    //TODO: print error
    throw Exception(jsonDecode(response.body)['message']);
  }
}
