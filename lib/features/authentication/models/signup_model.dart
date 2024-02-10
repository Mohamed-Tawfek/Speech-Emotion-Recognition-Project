class SignUpModel {
  String? message;
  SignUpModel.fromJson(Map<String, dynamic> json) {
    message = json['message'].toString();
  }
}
