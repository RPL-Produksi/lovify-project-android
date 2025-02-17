class LoginModel {
  final String credential;
  final String password;

  LoginModel({
    required this.credential,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'login': credential,
      'password': password,
    };
  }
}