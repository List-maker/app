class TokenModel {
  TokenModel(this.refreshToken, this.accessToken);

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      json['refreshToken'],
      json['accessToken'],
    );
  }

  final String refreshToken;
  final String accessToken;
}
