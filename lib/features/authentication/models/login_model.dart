class LoginModel {
 late String token;
late  String message;
late  String userName;
 late String email;
 late String image;
 late String id;
 late int statusCode;
  LoginModel.fromJson(Map<String, dynamic> json,statusCode) {
    message = json['message']??'';

    if(statusCode==200){
      userName = json['user']['fullname']??'';
      email = json['user']['email']??'';
      token = json['token']??'';
      id=json['user']['_id']??'';
      image = json['user']['imgCover'];

    }


  }
}
