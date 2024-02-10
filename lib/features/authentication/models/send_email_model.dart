class SendEmailModel{
 late String message;

  SendEmailModel.fromJson(Map<String,dynamic>json){

    message=json['message'];




  }


}