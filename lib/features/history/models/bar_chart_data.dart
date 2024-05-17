import 'package:flutter/material.dart';

class BarChartData {
  BarChartData(this.barTitle, this.happy, this.angry, this.surprised,this.fear,this.sad,this.calm,this.natural,this.disgusted){

    total=angry+happy+surprised+natural+calm+sad+fear+disgusted;

  }

  String barTitle;
   int angry;
   int happy;
   int surprised;
   int natural;
   int calm;
   int sad;
   int fear;
   int disgusted;

int total=0;


}


class PieChartData {
  PieChartData(this.title, this.number, [this.color]);
  final String title;
  final int number;
  final Color? color;
}