import 'package:speech_emotion_recognition_project/features/history/models/daily_model.dart';

class WeeklyModel {
  late WeeklyEmotionModel first;
  late WeeklyEmotionModel second;
  late WeeklyEmotionModel third;
  late WeeklyEmotionModel fourth;
  WeeklyModel.fromJson(Map<String, dynamic> json) {
    first = WeeklyEmotionModel.fromJson(json['Month']['Week 1']);
    second = WeeklyEmotionModel.fromJson(json['Month']['Week 2']);
    third = WeeklyEmotionModel.fromJson(json['Month']['Week 3']);
    fourth = WeeklyEmotionModel.fromJson(json['Month']['Week 4']);
  }
}
class WeeklyEmotionModel{

  late int angry;
  late int happy;
  late int surprised;
  WeeklyEmotionModel.fromJson(Map<String,dynamic>json){
    angry=json['angry'];
    happy=json['happy'];
    surprised=json['surprised'];
  }


}