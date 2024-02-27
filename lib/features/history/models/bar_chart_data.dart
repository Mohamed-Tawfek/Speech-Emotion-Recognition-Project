import 'package:flutter/material.dart';

class BarChartData {
  BarChartData(this.barTitle, this.happy, this.angry, this.surprised,);

  String barTitle;
  int happy;
  int angry;
  int surprised;

}


class PieChartData {
  PieChartData(this.title, this.number, [this.color]);
  final String title;
  final int number;
  final Color? color;
}