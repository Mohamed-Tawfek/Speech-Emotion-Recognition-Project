 import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../modes_controller/modes_cubit.dart';
import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';
import '../models/bar_chart_data.dart';

class DailyAnalysisChart extends StatelessWidget {
  const DailyAnalysisChart({super.key, required this.dataSource});
  final List<PieChartData>? dataSource;
  @override
  Widget build(BuildContext context) {
    bool appMode = AppModeCubit.get(context).isDark;

    return SfCircularChart(
        title: ChartTitle(
            text: 'Daily Emotions Analysis' ,
            textStyle: TextStyle(
                color: appMode ? DarkColors.textColor : LightColors.textColor)),
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
