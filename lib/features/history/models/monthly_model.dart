class MonthlyModel{
 late MonthlyEmotionModel january;
 late MonthlyEmotionModel february;
 late MonthlyEmotionModel march;
 late MonthlyEmotionModel april;
 late MonthlyEmotionModel may;
 late MonthlyEmotionModel june;
 late MonthlyEmotionModel july;
 late MonthlyEmotionModel august;
 late MonthlyEmotionModel september;
 late MonthlyEmotionModel october;
 late MonthlyEmotionModel november;
 late MonthlyEmotionModel december;
 MonthlyModel.fromJson(Map<String,dynamic>json){
   Map yearData=json['Year'];
  List yearNames= yearData.keys.toList();
    january=MonthlyEmotionModel.fromJson(yearData[yearNames[0]]);
    february=MonthlyEmotionModel.fromJson(yearData[yearNames[1]]);
    march=MonthlyEmotionModel.fromJson(yearData[yearNames[2]]);
    april=MonthlyEmotionModel.fromJson(yearData[yearNames[3]]);
    may=MonthlyEmotionModel.fromJson(yearData[yearNames[4]]);
    june=MonthlyEmotionModel.fromJson(yearData[yearNames[5]]);
    july=MonthlyEmotionModel.fromJson(yearData[yearNames[6]]);
    august=MonthlyEmotionModel.fromJson(yearData[yearNames[7]]);
    september=MonthlyEmotionModel.fromJson(yearData[yearNames[8]]);
    october=MonthlyEmotionModel.fromJson(yearData[yearNames[9]]);
    november=MonthlyEmotionModel.fromJson(yearData[yearNames[10]]);
    december=MonthlyEmotionModel.fromJson(yearData[yearNames[11]]);
 }

}

class MonthlyEmotionModel{

  late int angry;
  late int happy;
  late int surprised;
  late int natural;
  late int calm;
  late int sad;
  late int fear;
  late int disgusted;
  MonthlyEmotionModel.fromJson(Map<String,dynamic>json){
    angry=json['angry'];
    happy=json['happy'];
    surprised=json['surprise'];
    calm=json['calm'];
    natural=json['neutral'];
    sad=json['sad'];
    fear=json['fear'];
    disgusted=json['disgust'];
  }


}