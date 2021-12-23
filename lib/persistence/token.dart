import 'package:list/model/token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveToken(TokenModel token) async {
  final prefs = await SharedPreferences.getInstance();

  prefs.setString('access-token', token.accessToken);
  prefs.setString('refresh-token', token.refreshToken);
}

Future<TokenModel> getToken() async {
  final prefs = await SharedPreferences.getInstance();

  final accessToken = prefs.getString('access-token') ?? 'null';
  final refreshToken = prefs.getString('refresh-token') ?? 'null';

  return new TokenModel(refreshToken: refreshToken, accessToken: accessToken);
}
