import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:list/database/token_db.dart';
import 'package:list/model/item_model.dart';
import 'package:list/model/token_model.dart';

import 'config.dart';

Future<ItemModel> fetchItem(int id) async {
  TokenModel token = await getToken();

  String accessToken = token.toMap()['access_token'];

  final response = await http.get(
    Uri.parse(apiHost + '/api/item/$id'),
    headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"},
  );

  if (response.statusCode == 200) {
    return ItemModel.fromJson(jsonDecode(response.body)['data']);
  } else {
    throw Exception(jsonDecode(response.body)['message']);
  }
}

Future<void> checkItem(int id) async {
  TokenModel token = await getToken();

  String accessToken = token.toMap()['access_token'];

  final response = await http.put(
    Uri.parse(apiHost + '/api/item/$id/check'),
    headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"},
  );

  if (response.statusCode == 200) {
    return;
  } else {
    throw Exception(jsonDecode(response.body)['message']);
  }
}

Future<void> updateItem(int id, String name) async {
  TokenModel token = await getToken();

  String accessToken = token.toMap()['access_token'];

  final response = await http.put(
    Uri.parse(apiHost + '/api/item/$id'),
    headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken",
      "Content-Type": "application/x-www-form-urlencoded",
    },
    encoding: Encoding.getByName('utf-8'),
    body: {
      "name": name,
    },
  );

  if (response.statusCode == 200) {
    return;
  } else {
    throw Exception(jsonDecode(response.body)['message']);
  }
}

