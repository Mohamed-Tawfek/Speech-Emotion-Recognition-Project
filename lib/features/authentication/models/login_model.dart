class LoginModel {
  String? token;
  String? message;
  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    message = json['message'];
  }
}
