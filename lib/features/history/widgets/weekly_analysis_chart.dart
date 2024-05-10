import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../modes_controller/modes_cubit.dart';
import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';
import '../controller/week_cubit/week_cubit.dart';
import '../models/bar_chart_data.dart';
import 'chart_map.dart';

class WeeklyAnalysisChart extends StatefulWidget {
  const WeeklyAnalysisChart({super.key, required this.cubit});
  final WeekCubit cubit;

  @override
  State<WeeklyAnalysisChart> createState() => _WeeklyAnalysisChartState();
}

class _WeeklyAnalysisChartState extends State<WeeklyAnalysisChart> {
  @override
  void initState() {
    // Future.delayed(Duration(milliseconds: 1500)).then((value) {
    //   widget.cubit.showCongMessage(context);
    //
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool appMode = AppModeCubit.get(context).isDark;

    return Column(
      children: [
        Expanded(

          child: SfCartesianChart(
              enableAxisAnimation: true,
              primaryXAxis: CategoryAxis(
                labelStyle: const TextStyle(fontSize: 20),
                title: AxisTitle(
                    text: 'Week',
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
                  text: 'Weekly Emotions Analysis',
                  textStyle: TextStyle(
                      color: appMode
                          ? DarkColors.textColor
                          : LightColors.textColor)),
              series: <CartesianSeries>[
                ColumnSeries<BarChartData, String>(
                    color: Color(0xffCFD8DC),
                    dataSource: widget.cubit.chartData,
                    xValueMapper: (BarChartData data, _) =>
                        data.barTitle.toString(),
                    yValueMapper: (BarChartData data, _) => data.natural),
                ColumnSeries<BarChartData, String>(
                    color: Color(0xff00BEFF),
                    dataSource: widget.cubit.chartData,
                    xValueMapper: (BarChartData data, _) =>
                        data.barTitle.toString(),
                    yValueMapper: (BarChartData data, _) => data.calm),
                ColumnSeries<BarChartData, String>(
                    color: Color(0xffFFEB00),
                    dataSource: widget.cubit.chartData,
                    xValueMapper: (BarChartData data, _) =>
                        data.barTitle.toString(),
                    yValueMapper: (BarChartData data, _) => data.happy),
                ColumnSeries<BarChartData, String>(
                    color: Color(0xff0057AE),
                    dataSource: widget.cubit.chartData,
                    xValueMapper: (BarChartData data, _) =>
                        data.barTitle.toString(),
                    yValueMapper: (BarChartData data, _) => data.sad),
                ColumnSeries<BarChartData, String>(
                    color: Color(0xffFF2414),
                    dataSource: widget.cubit.chartData,
                    xValueMapper: (BarChartData data, _) =>
                        data.barTitle.toString(),
                    yValueMapper: (BarChartData data, _) => data.angry),
                ColumnSeries<BarChartData, String>(
                    color: Color(0xffB7043C),
                    dataSource: widget.cubit.chartData,
                    xValueMapper: (BarChartData data, _) =>
                        data.barTitle.toString(),
                    yValueMapper: (BarChartData data, _) => data.fear),
                ColumnSeries<BarChartData, String>(
                    color: Color(0xffA1E533),
                    dataSource: widget.cubit.chartData,
                    xValueMapper: (BarChartData data, _) =>
                        data.barTitle.toString(),
                    yValueMapper: (BarChartData data, _) => data.disgusted),
                ColumnSeries<BarChartData, String>(
                    color: Color(0xffFF6900),
                    dataSource: widget.cubit.chartData,
                    xValueMapper: (BarChartData data, _) =>
                        data.barTitle.toString(),
                    yValueMapper: (BarChartData data, _) => data.surprised),
              ]),
        ),
        const BuildChartMap(),
      ],
    );
  }
}
