class DailyModel{

 late int angry;
 late int happy;
 late int surprised;
 DailyModel.fromJson(Map<String,dynamic>json){
   angry=json['Day']['angry'];
   happy=json['Day']['happy'];
   surprised=json['Day']['surprised'];
 }


}