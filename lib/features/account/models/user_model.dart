class UserModel {
  late String firstname;
  late String lastname;
  late String fullName;
  late String gender;
  late String birthday;
  late String email;

  late int phone;
  late int day;
  late int month;
  late int year;
  String? imgCover;
 late DateTime date;
  UserModel.fromJson(Map<String, dynamic> json) {
    firstname = json['user']['firstname'];
    lastname = json['user']['lastname'];
    fullName = json['user']['fullname'];
    gender = json['user']['gender'];

    birthday = json['user']['birthday'];

    email = json['user']['email'];
    phone = json['user']['phone'];
    imgCover = json['user']['imgCover'];
    if (imgCover == 'https://speech-sapm.onrender.com/user/null') {
      imgCover = null;
    }
      date = DateTime.parse(birthday);
    day = date.day;
    month = date.month;
    year = date.year;
  }
}
