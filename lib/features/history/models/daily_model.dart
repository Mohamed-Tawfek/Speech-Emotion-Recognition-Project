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
    angry = json['Day']['angry'];
    happy = json['Day']['happy'];
    surprised = json['Day']['surprised'];
    natural = json['Day']['neutral'];
    calm = json['Day']['calm'];
    sad = json['Day']['sad'];
    fear = json['Day']['fear'];
    disgusted = json['Day']['disgust'];
  }
}
