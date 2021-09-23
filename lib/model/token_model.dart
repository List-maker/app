class TokenModel {
  final String refreshToken;
  final String accessToken;

  TokenModel({
    required this.refreshToken,
    required this.accessToken,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      refreshToken: json['refresh_token'],
      accessToken: json['access_token'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': 1,
      'refresh_token': refreshToken,
      'access_token': accessToken,
    };
  }
}
