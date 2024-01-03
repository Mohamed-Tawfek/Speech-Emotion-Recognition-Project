import 'package:flutter/material.dart';

class BarChartData {
  BarChartData(this.barTitle, this.happy, this.angery, this.normal, this.sad);

  String barTitle;
  int happy;
  int angery;
  int normal;
  int sad;
}


class PieChartData {
  PieChartData(this.title, this.number, [this.color]);
  final String title;
  final int number;
  final Color? color;
}