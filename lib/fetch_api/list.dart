import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:list/call_db/token.dart';
import 'package:list/model/list_model.dart';
import 'package:list/model/token_model.dart';

import 'config.dart';

Future<List<ListModel>> fetchList() async {
  TokenModel token = await getToken();

  String access_token = token.toMap()['access_token'];

  final response = await http.get(
    Uri.parse(api_host + '/list'),
    headers: {HttpHeaders.authorizationHeader: "Bearer ${access_token}"},
  );

  if (response.statusCode == 200) {
    return List<ListModel>(jsonDecode(response.body)['data']);
  } else {
    throw Exception(jsonDecode(response.body)['message']);
  }
}

}