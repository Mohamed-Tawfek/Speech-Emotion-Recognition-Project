import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/bar_chart_data.dart';

class DailyAnalysisChart extends StatelessWidget {
  const DailyAnalysisChart({super.key, required this.dataSource});
  final List<PieChartData>? dataSource;
  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
        title:   ChartTitle(text: 'Daily Emotions Analysis',

        ),

        series: <CircularSeries>[
          PieSeries<PieChartData, String>(


            dataSource: dataSource,
            pointColorMapper: (PieChartData data, _) => data.color,
            xValueMapper: (PieChartData data, _) => data.title,
            yValueMapper: (PieChartData data, _) => data.number,
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              overflowMode: OverflowMode.trim,
            ),
          )
        ]);
  }
}


