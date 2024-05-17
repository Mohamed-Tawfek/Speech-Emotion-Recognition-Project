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

          tooltipBehavior: TooltipBehavior(
              enable: true,
              duration: 1000,
              color: appMode ? DarkColors.primary : LightColors.primary,
              // Templating the tooltip
              builder: (data, ChartPoint point, dynamic series,
                  int pointIndex, int seriesIndex) {
                int numbers = 0;
                String emotion='';

                if (seriesIndex == 0) {
                  numbers = data.natural;
                  emotion='Natural';
                }
                if (seriesIndex == 1) {
                  numbers = data.calm;
                  emotion='Calm';

                }
                if (seriesIndex == 2) {
                  numbers = data.happy;
                  emotion='Happy';

                }
                if (seriesIndex == 3) {
                  numbers = data.sad;
                  emotion='Sad';

                }
                if (seriesIndex == 4) {
                  numbers = data.angry;
                  emotion='Angry';

                }
                if (seriesIndex == 5) {
                  numbers = data.fear;
                  emotion='Fear';

                }
                if (seriesIndex == 6) {
                  numbers = data.disgusted;
                  emotion='Disgusted';

                }
                if (seriesIndex == 7) {
                  numbers = data.surprised;
                  emotion='Surprised';

                }

                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Frequency of $emotion is $numbers',
                    style: TextStyle(
                        color: appMode
                            ? DarkColors.scaffoldColor
                            : LightColors.scaffoldColor),
                  ),
                );
              }),

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
                text: 'The percentage of repetitions of the emotion',
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
                selectionBehavior: SelectionBehavior(
                  enable: true,
                ),
                color: Color(0xffCFD8DC),
                dataSource: dataSource,
                xValueMapper: (BarChartData data, _) =>
                    data.barTitle.toString(),
                 yValueMapper: (BarChartData data, _) {
                  num number = data.total != 0
                      ? ((data.natural / data.total) * 100).round().toInt()
                      : 0;
                  return number;
                }


            ),
            ColumnSeries<BarChartData, String>(
                selectionBehavior: SelectionBehavior(
                  enable: true,
                ),
                color: Color(0xff00BEFF),
                dataSource: dataSource,
                xValueMapper: (BarChartData data, _) =>
                    data.barTitle.toString(),
                yValueMapper: (BarChartData data, _) {
                  num number = data.total != 0
                      ? ((data.calm / data.total) * 100).round().toInt()
                      : 0;
                  return number;
                }
                 ),
            ColumnSeries<BarChartData, String>( selectionBehavior: SelectionBehavior(
              enable: true,
            ),
                color: Color(0xffFFEB00),
                dataSource: dataSource,
                xValueMapper: (BarChartData data, _) =>
                    data.barTitle.toString(),
                yValueMapper: (BarChartData data, _) {
                  num number = data.total != 0
                      ? ((data.happy / data.total) * 100).round().toInt()
                      : 0;
                  return number;
                }
                ),
            ColumnSeries<BarChartData, String>( selectionBehavior: SelectionBehavior(
              enable: true,
            ),
                color: Color(0xff0057AE),
                dataSource: dataSource,
                xValueMapper: (BarChartData data, _) =>
                    data.barTitle.toString(),
                yValueMapper: (BarChartData data, _) {
                  num number = data.total != 0
                      ? ((data.sad / data.total) * 100).round().toInt()
                      : 0;
                  return number;
                }
               ),
            ColumnSeries<BarChartData, String>( selectionBehavior: SelectionBehavior(
              enable: true,
            ),
                color: Color(0xffFF2414),
                dataSource: dataSource,
                xValueMapper: (BarChartData data, _) =>
                    data.barTitle.toString(),
                yValueMapper: (BarChartData data, _) {
                  num number = data.total != 0
                      ? ((data.angry / data.total) * 100).round().toInt()
                      : 0;
                  return number;
                }
               ),
            ColumnSeries<BarChartData, String>( selectionBehavior: SelectionBehavior(
              enable: true,
            ),
                color: Color(0xffB7043C),
                dataSource: dataSource,
                xValueMapper: (BarChartData data, _) =>
                    data.barTitle.toString(),
                yValueMapper: (BarChartData data, _) {
                  num number = data.total != 0
                      ? ((data.fear / data.total) * 100).round().toInt()
                      : 0;
                  return number;
                }
                ),
            ColumnSeries<BarChartData, String>( selectionBehavior: SelectionBehavior(
              enable: true,
            ),
                color:Color(0xffA1E533),
                dataSource: dataSource,
                xValueMapper: (BarChartData data, _) =>
                    data.barTitle.toString(),
                yValueMapper: (BarChartData data, _) {
                  num number = data.total != 0
                      ? ((data.disgusted / data.total) * 100).round().toInt()
                      : 0;
                  return number;
                }
              ),
            ColumnSeries<BarChartData, String>( selectionBehavior: SelectionBehavior(
              enable: true,
            ),
                color: Color(0xffFF6900),
                dataSource: dataSource,
                xValueMapper: (BarChartData data, _) =>
                    data.barTitle.toString(),
                yValueMapper: (BarChartData data, _) {
                  num number = data.total != 0
                      ? ((data.surprised / data.total) * 100).round().toInt()
                      : 0;
                  return number;
                }
                ),
          ]),
    );
  }
}
