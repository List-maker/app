import 'dart:convert';

import 'package:get/get.dart';

class ApiModel {
  final String message;
  final Map<String, dynamic>? data;

  ApiModel(this.message, this.data);

  factory ApiModel.fromJson(Response res) {
    return ApiModel(
      jsonDecode(res.bodyString!)['message'],
      jsonDecode(res.bodyString!)['data'],
    );
  }
}

class Res {}
