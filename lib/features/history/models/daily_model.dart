class DailyModel {
  late int angry;
  late int happy;
  late int surprised;
  late int natural;
  late int calm;
  late int sad;
  late int fear;
  late int disgusted;
  DailyModel.fromJson(Map<String, dynamic> json) {
    angry = json['Day']['Angry'];
    happy = json['Day']['Happy'];
    surprised = json['Day']['Surprise'];
    natural = json['Day']['Neutral'];
    calm = json['Day']['Calm'];
    sad = json['Day']['Sad'];
    fear = json['Day']['Fear'];
    disgusted = json['Day']['Disgust'];
  }
}
