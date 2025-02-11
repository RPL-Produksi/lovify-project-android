class LoginModel {
  final String credentials;
  final String password;

  LoginModel({
    required this.credentials,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'login': credentials,
      'password': password,
    };
  }
}