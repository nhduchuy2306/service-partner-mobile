class TokenResponse {
  TokenResponse({required this.token, required this.refreshToken});

  late final String token;
  late final String refreshToken;

  TokenResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['token'] = token;
    data['refreshToken'] = refreshToken;
    return data;
  }
}
