import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:list/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config.dart';

Future<UserModel> fetchUser() async {
  final prefs = await SharedPreferences.getInstance();

  final token = prefs.getString('access-token');

  final response = await http.get(
    Uri.parse(apiHost + '/api/user'),
    headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
  );

  if (response.statusCode == 200) {
    return UserModel.fromJson(jsonDecode(response.body)['data']);
  } else {
    throw Exception(jsonDecode(response.body)['message']);
  }
}
