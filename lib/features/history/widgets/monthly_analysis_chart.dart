
import 'package:flutter/material.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/bar_chart_data.dart';

class MonthlyAnalysisChart extends StatelessWidget {
  const MonthlyAnalysisChart({super.key, required this.dataSource});
  final List<BarChartData>? dataSource;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.deviceHeight * 0.7,
      child: SfCartesianChart(
          enableAxisAnimation: true,
          primaryXAxis: const CategoryAxis(
            title: AxisTitle(text: 'Months'),
            majorGridLines: MajorGridLines(width: 2),
            majorTickLines: MajorTickLines(width: 0),
          ),
          primaryYAxis: const NumericAxis(
            title: AxisTitle(text: 'The number of repetitions of the emotion'),
          ),
          title: const ChartTitle(text: 'Monthly Emotions Analysis'),
          series: <CartesianSeries>[
            ColumnSeries<BarChartData, String>(
                color: Colors.yellow,
                dataSource: dataSource,
                xValueMapper: (BarChartData data, _) =>
                    data.barTitle.toString(),
                yValueMapper: (BarChartData data, _) => data.happy),
            ColumnSeries<BarChartData, String>(
                color: Colors.red,
                dataSource: dataSource,
                xValueMapper: (BarChartData data, _) =>
                    data.barTitle.toString(),
                yValueMapper: (BarChartData data, _) => data.angery),
            ColumnSeries<BarChartData, String>(
                color: Colors.green,
                dataSource: dataSource,
                xValueMapper: (BarChartData data, _) =>
                    data.barTitle.toString(),
                yValueMapper: (BarChartData data, _) => data.normal),
            ColumnSeries<BarChartData, String>(
                color: Colors.purpleAccent,
                dataSource: dataSource,
                xValueMapper: (BarChartData data, _) =>
                    data.barTitle.toString(),
                yValueMapper: (BarChartData data, _) => data.sad),
          ]),
    );
  }
}

