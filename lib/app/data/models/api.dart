import 'dart:convert';

import 'package:get/get.dart';

class ApiModel {
  ApiModel(this.message, this.data);

  factory ApiModel.fromJson(Response<dynamic> res) {
    return ApiModel(
      jsonDecode(res.bodyString!)['message'],
      jsonDecode(res.bodyString!)['data'],
    );
  }

  final String message;
  final Map<String, dynamic>? data;
}

class Res {}
