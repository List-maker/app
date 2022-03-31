class TokenModel {
  final String refreshToken;
  final String accessToken;

  TokenModel(this.refreshToken, this.accessToken);

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      json['refreshToken'],
      json['accessToken'],
    );
  }
}
