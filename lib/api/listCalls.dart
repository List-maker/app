import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:list/database/token_db.dart';
import 'package:list/model/list_model.dart';
import 'package:list/model/token_model.dart';

import 'config.dart';

Future<ListModel> fetchList(int id) async {
  TokenModel token = await getToken();

  String accessToken = token.toMap()['access_token'];

  final response = await http.get(
    Uri.parse(apiHost + '/api/list/$id'),
    headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"},
  );

  if (response.statusCode == 200) {
    return ListModel.fromJson(jsonDecode(response.body)['data']);
  } else {
    throw Exception(jsonDecode(response.body)['message']);
  }
}

Future<List> fetchListsId() async {
  TokenModel token = await getToken();

  String accessToken = token.toMap()['access_token'];

  final response = await http.get(
    Uri.parse(apiHost + '/api/list/user'),
    headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"},
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body)['data'];
  } else {
    throw Exception(jsonDecode(response.body)['message']);
  }
}

Future<void> deleteList(int id) async {

  TokenModel token = await getToken();

  String accessToken = token.toMap()['access_token'];

  final response = await http.delete(
    Uri.parse(apiHost + '/api/list/$id'),
    headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"},
  );

  if (response.statusCode == 200) {
    return;
  } else {
    throw Exception(jsonDecode(response.body)['message']);
  }

}
