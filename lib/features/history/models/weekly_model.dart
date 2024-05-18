
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

class WeeklyEmotionModel {
  late int angry;
  late int happy;
  late int surprised;
  late int natural;
  late int calm;
  late int sad;
  late int fear;
  late int disgusted;
  WeeklyEmotionModel.fromJson(Map<String, dynamic> json) {
    angry = json['angry'];
    happy = json['happy'];
    surprised = json['surprised'];
    natural = json['neutral'];
    calm = json['calm'];
    sad = json['sad'];
    fear = json['fear'];
    disgusted = json['disgust'];
  }
}
