import 'package:get/get.dart';
import 'package:list/app/data/models/api.dart';
import 'package:list/app/data/providers/api.dart';

class AuthServices extends GetxService {
  ApiProvider apiProvider = ApiProvider()..onInit();

  Future<MapEntry<int, String?>> login(String login, String password) async {
    Response res = await apiProvider.login(login, password);

    if (res.statusCode == 200) {
      return MapEntry(200, null);
    } else {
      return MapEntry(res.statusCode!, ApiModel.fromJson(res).message);
    }
  }
}
