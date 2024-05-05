class FollowedModel{

late  String token;
late String userName;
late  String userEmail;
late  String userImage;

late  String userID;

  FollowedModel(Map<String,dynamic>json){
    token=json['token'];
    userName=json['userName'];
    userEmail=json['userEmail'];
    userImage=json['userImage'];
    userID=json['userID'];

  }


}