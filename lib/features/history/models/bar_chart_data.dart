import 'package:flutter/material.dart';

class BarChartData {
  BarChartData(this.barTitle, this.happy, this.angry, this.surprised,this.fear,this.sad,this.calm,this.natural,this.disgusted);

  String barTitle;
   int angry;
   int happy;
   int surprised;
   int natural;
   int calm;
   int sad;
   int fear;
   int disgusted;




}


class PieChartData {
  PieChartData(this.title, this.number, [this.color]);
  final String title;
  final int number;
  final Color? color;
}