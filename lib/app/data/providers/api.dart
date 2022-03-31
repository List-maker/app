import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:list/core/config/api.dart';

class ApiProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = API_BASE_URL;
    httpClient.defaultContentType =
        'application/x-www-form-urlencoded ;charset=utf-8';
    httpClient.addAuthenticator((dynamic request) async {
      GetStorage storage = GetStorage();
      if (storage.hasData('token')) {
        request.headers['Authorization'] =
            'Bearer ${GetStorage().read('token')}';
      }
      return request;
    });
    httpClient.maxAuthRetries = 3;
  }
}
