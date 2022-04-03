import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/config/api.dart';

class ApiProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = API_BASE_URL;
    httpClient.defaultContentType =
        'application/x-www-form-urlencoded; charset=utf-8';
    httpClient.addRequestModifier((Request<dynamic> request) async {
      final GetStorage storage = GetStorage();
      if (storage.hasData('token')) {
        request.headers['Authorization'] = 'Bearer ${storage.read('token')}';
      }
      return request;
    });
    httpClient.maxAuthRetries = 1;
  }
}
