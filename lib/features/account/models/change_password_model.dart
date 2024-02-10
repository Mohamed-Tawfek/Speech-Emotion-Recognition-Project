class ChangePasswordModel{


 late String message;

 ChangePasswordModel.fromJson(Map<String,dynamic>json){

   message=json['message'];
 }


}