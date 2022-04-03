class TokenModel {
  TokenModel(this.refreshToken, this.accessToken);

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      json['refresh_token'],
      json['access_token'],
    );
  }

  final String refreshToken;
  final String accessToken;
}
