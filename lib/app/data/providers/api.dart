import 'package:get/get.dart';
import 'package:list/core/config/api.dart';

class ApiProvider extends GetConnect {
  @override
  void onInit() {
    // httpClient.defaultDecoder = ApiModel.fromJson as Decoder?;
    httpClient.baseUrl = API_BASE_URL;
    httpClient.defaultContentType =
        'application/x-www-form-urlencoded ;charset=utf-8';
    // httpClient.addAuthenticator((dynamic request) async {
    //   log("addAuthenticator() was call");
    //   GetStorage storage = GetStorage();
    //   if (storage.hasData('token')) {
    //     request.headers['Authorization'] =
    //         'Bearer ${GetStorage().read('token')}';
    //   } else {
    //     log("heer");
    //   }
    //   return request;
    // });

    httpClient.maxAuthRetries = 3;
  }

  Future<Response> login(String login, password) =>
      get('auth/login', query: {'login': login, 'password': password});
}
