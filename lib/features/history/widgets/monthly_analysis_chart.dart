import 'package:flutter/material.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../modes_controller/modes_cubit.dart';
import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';
import '../models/bar_chart_data.dart';

class MonthlyAnalysisChart extends StatelessWidget {
  const MonthlyAnalysisChart({super.key, required this.dataSource});
  final List<BarChartData>? dataSource;
  @override
  Widget build(BuildContext context) {
    bool appMode = AppModeCubit.get(context).isDark;
    return SizedBox(
      height: context.deviceHeight * 0.7,
      child: SfCartesianChart(
          enableAxisAnimation: true,
          primaryXAxis: CategoryAxis(
            title: AxisTitle(
                text: 'Months',
                textStyle: TextStyle(
                    color: appMode
                        ? DarkColors.textColor
                        : LightColors.textColor)),
            majorGridLines: const MajorGridLines(width: 2),
            majorTickLines: const MajorTickLines(width: 0),
          ),
          primaryYAxis: NumericAxis(
            title: AxisTitle(
                text: 'The number of repetitions of the emotion',
                textStyle: TextStyle(
                    color: appMode
                        ? DarkColors.textColor
                        : LightColors.textColor)),
          ),
          title: ChartTitle(
              text: 'Monthly Emotions Analysis',
              textStyle: TextStyle(
                  color:
                      appMode ? DarkColors.textColor : LightColors.textColor)),
          series: <CartesianSeries>[
            ColumnSeries<BarChartData, String>(
                color: Color(0xffCFD8DC),
                dataSource: dataSource,
                xValueMapper: (BarChartData data, _) =>
                    data.barTitle.toString(),
                yValueMapper: (BarChartData data, _) => data.natural),
            ColumnSeries<BarChartData, String>(
                color: Color(0xff00BEFF),
                dataSource: dataSource,
                xValueMapper: (BarChartData data, _) =>
                    data.barTitle.toString(),
                yValueMapper: (BarChartData data, _) => data.calm),
            ColumnSeries<BarChartData, String>(
                color: Color(0xffFFEB00),
                dataSource: dataSource,
                xValueMapper: (BarChartData data, _) =>
                    data.barTitle.toString(),
                yValueMapper: (BarChartData data, _) => data.happy),
            ColumnSeries<BarChartData, String>(
                color: Color(0xff0057AE),
                dataSource: dataSource,
                xValueMapper: (BarChartData data, _) =>
                    data.barTitle.toString(),
                yValueMapper: (BarChartData data, _) => data.sad),
            ColumnSeries<BarChartData, String>(
                color: Color(0xffFF2414),
                dataSource: dataSource,
                xValueMapper: (BarChartData data, _) =>
                    data.barTitle.toString(),
                yValueMapper: (BarChartData data, _) => data.angry),
            ColumnSeries<BarChartData, String>(
                color: Color(0xffB7043C),
                dataSource: dataSource,
                xValueMapper: (BarChartData data, _) =>
                    data.barTitle.toString(),
                yValueMapper: (BarChartData data, _) => data.fear),
            ColumnSeries<BarChartData, String>(
                color:Color(0xffA1E533),
                dataSource: dataSource,
                xValueMapper: (BarChartData data, _) =>
                    data.barTitle.toString(),
                yValueMapper: (BarChartData data, _) => data.disgusted),
            ColumnSeries<BarChartData, String>(
                color: Color(0xffFF6900),
                dataSource: dataSource,
                xValueMapper: (BarChartData data, _) =>
                    data.barTitle.toString(),
                yValueMapper: (BarChartData data, _) => data.surprised),
          ]),
    );
  }
}
