class ChangeAccountModel {
  late String firstname;
  late String lastname;
  late String fullName;
  late String gender;
  late String birthday;
  late String email;

  late String phone;
  late int day;
  late int month;
  late int year;
  String? imgCover;
  late DateTime date;
  ChangeAccountModel.fromJson(Map<String, dynamic> json) {
    firstname = json['newUpdate']['firstname'];
    lastname = json['newUpdate']['lastname'];
    fullName = json['newUpdate']['fullname'];
    gender = json['newUpdate']['gender'];

    birthday = json['newUpdate']['birthday'];

    email = json['newUpdate']['email'];
    phone = json['newUpdate']['phone'].toString();
    imgCover = json['newUpdate']['imgCover'];
    if (imgCover == 'https://speech-sapm.onrender.com/user/null') {
      imgCover = null;
    }
    date = DateTime.parse(birthday);
    day = date.day;
    month = date.month;
    year = date.year;
  }
}
