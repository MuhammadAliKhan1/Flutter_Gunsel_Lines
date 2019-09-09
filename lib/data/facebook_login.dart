

class FacebookLogin {
  String token;
  String language;

  FacebookLogin({this.token, this.language});

  factory FacebookLogin.fromJson(Map<String, dynamic> json) {
    return FacebookLogin(
      token: json['Token'],
      language: json['Language'],
    );
  }
}
