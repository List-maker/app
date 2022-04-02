import 'package:get/get.dart';

import '../../../models/api.dart';
import '../repository.dart';

class AuthServices extends GetxService {
  final AuthRepository _authRepository = AuthRepository();

  Future<MapEntry<int, String?>> login(String login, String password) async {
    final Response<dynamic> res = await _authRepository.login(login, password);

    if (res.statusCode == 200) {
      return const MapEntry<int, String?>(200, null);
    } else {
      return MapEntry<int, String?>(
          res.statusCode!, ApiModel.fromJson(res).message);
    }
  }
}
