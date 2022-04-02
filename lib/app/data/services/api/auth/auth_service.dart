import 'package:get/get.dart';

import '../../../models/api.dart';
import '../../../providers/api.dart';

class AuthServices extends GetxService {
  ApiProvider apiProvider = ApiProvider()..onInit();

  Future<MapEntry<int, String?>> login(String login, String password) async {
    final Response<dynamic> res = await apiProvider.get('auth/login',
        query: <String, String>{'login': login, 'password': password});

    if (res.statusCode == 200) {
      return const MapEntry<int, String?>(200, null);
    } else {
      return MapEntry<int, String?>(
          res.statusCode!, ApiModel.fromJson(res).message);
    }
  }
}
