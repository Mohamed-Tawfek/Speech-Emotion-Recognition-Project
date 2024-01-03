import 'package:flutter/material.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controller/week_cubit/week_cubit.dart';
import '../model/bar_chart_data.dart';
import 'chart_map.dart';

class WeeklyAnalysisChart extends StatelessWidget {
  const WeeklyAnalysisChart({super.key,required this.cubit});
  final WeekCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.deviceHeight * 0.7,
          child: SfCartesianChart(
              enableAxisAnimation: true,
              primaryXAxis: const CategoryAxis(
                labelStyle: TextStyle(fontSize: 20),
                title: AxisTitle(text: 'Week'),
                majorGridLines: MajorGridLines(width: 2),
                majorTickLines: MajorTickLines(width: 0),
              ),
              primaryYAxis: const NumericAxis(
                title: AxisTitle(
                    text: 'The number of repetitions of the emotion'),
              ),
              title: const ChartTitle(text: 'Weekly Emotions Analysis'),
              series: <CartesianSeries>[
                ColumnSeries<BarChartData, String>(
                    color: Colors.yellow,
                    dataSource: cubit.chartData,
                    xValueMapper: (BarChartData data, _) =>
                        data.barTitle.toString(),
                    yValueMapper: (BarChartData data, _) => data.happy),
                ColumnSeries<BarChartData, String>(

                    color: Colors.red,
                    dataSource: cubit.chartData,
                    xValueMapper: (BarChartData data, _) =>
                        data.barTitle.toString(),
                    yValueMapper: (BarChartData data, _) =>
                    data.angery),
                ColumnSeries<BarChartData, String>(
                    color: Colors.green,
                    dataSource: cubit.chartData,
                    xValueMapper: (BarChartData data, _) =>
                        data.barTitle.toString(),
                    yValueMapper: (BarChartData data, _) =>
                    data.normal),
                ColumnSeries<BarChartData, String>(
                    color: Colors.purpleAccent,
                    dataSource: cubit.chartData,
                    xValueMapper: (BarChartData data, _) =>
                        data.barTitle.toString(),
                    yValueMapper: (BarChartData data, _) => data.sad),
              ]),
        ),

        const BuildChartMap(),

      ],
    );
  }
}
