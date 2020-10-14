class AuthToken {
  final String type;
  final String token;

  AuthToken({this.type, this.token});

  factory AuthToken.fromJSON(Map<String, dynamic> json) {
    return AuthToken(
      type: json['type'],
      token: json['token']
    );
  }
}
