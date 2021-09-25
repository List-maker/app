import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:list/call_db/token.dart';
import 'package:list/model/token_model.dart';
import 'package:list/model/user_model.dart';

import 'config.dart';

Future<UserModel> fetchUser() async {

   TokenModel token = await getToken();

  String accessToken = token.toMap()['access_token'];

  final response = await http.get(
    Uri.parse(api_host + '/api/user'),
    headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"},
  );

  if (response.statusCode == 200) {
    return UserModel.fromJson(jsonDecode(response.body)['data']);
  } else {
    throw Exception(jsonDecode(response.body)['message']);
  }
}
