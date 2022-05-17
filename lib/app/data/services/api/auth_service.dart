import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../models/api.dart';
import '../../models/token.dart';
import 'repository.dart';

class AuthServices extends GetxService {
  final AuthRepository _authRepository = AuthRepository();

  Future<MapEntry<int, String?>> login(String login, String password) async {
    final Response<dynamic> res = await _authRepository.login(login, password);

    if (res.statusCode == 200) {
      GetStorage().write('token',
          TokenModel.fromJson(ApiModel.fromJson(res).data!).refreshToken);
      return const MapEntry<int, String?>(200, null);
    } else {
      return MapEntry<int, String?>(
          res.statusCode!, ApiModel.fromJson(res).message);
    }
  }

  Future<MapEntry<int, String?>> register(
      String username, String email, String password) async {
    final Response<dynamic> res =
        await _authRepository.register(username, email, password);

    if (res.statusCode == 200) {
      GetStorage().write('token',
          TokenModel.fromJson(ApiModel.fromJson(res).data!).refreshToken);
      return const MapEntry<int, String?>(200, null);
    } else {
      return MapEntry<int, String?>(
          res.statusCode!, ApiModel.fromJson(res).message);
    }
  }
}
