import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';
import '../../../modes_controller/modes_cubit.dart';
import '../models/bar_chart_data.dart';

class DailyAnalysisChart extends StatelessWidget {
 const DailyAnalysisChart(
      {super.key, required this.dataSource, required this.totalEmotionsNumber});
  final List<PieChartData>? dataSource;
  final int totalEmotionsNumber;

  @override
  Widget build(BuildContext context) {
    bool appMode = AppModeCubit.get(context).isDark;
    return SfCircularChart(
        title: ChartTitle(
            text: 'Daily Emotions Analysis',
            textStyle: TextStyle(
                color: appMode ? DarkColors.textColor : LightColors.textColor)),
        tooltipBehavior: TooltipBehavior(
            enable: true,
            duration: 1000,
            color: appMode ? DarkColors.primary : LightColors.primary,
            // Templating the tooltip
            builder: (dynamic data, ChartPoint point, dynamic series,
                int pointIndex, int seriesIndex) {

              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'Frequency of ${point.x} is ${point.y}',
                  style: TextStyle(
                      color: appMode
                          ? DarkColors.scaffoldColor
                          : LightColors.scaffoldColor),
                ),
              );
            }),


        series: <CircularSeries>[
          PieSeries<PieChartData, String>(
            // onPointLongPress: (ChartPointDetails d) {
            //   showToast(context,
            //       '${dataSource?[d.pointIndex!].title} : ${dataSource?[d.pointIndex!].number}');
            //
            // },

            selectionBehavior: SelectionBehavior(
              enable: true,
            ),
            explode: true,

            dataSource: dataSource,
            pointColorMapper: (PieChartData data, _) {
              return data.color;
            },
            xValueMapper: (PieChartData data, _) => data.title,
            yValueMapper: (PieChartData data, _) => data.number,
            dataLabelMapper: (PieChartData data, _) =>
                "${((data.number / totalEmotionsNumber) * 100).round()}%",

            dataLabelSettings:   DataLabelSettings(
              isVisible: true,
              labelPosition: ChartDataLabelPosition.outside,
              color:appMode?Colors.cyan: DarkColors.primary,
              overflowMode: OverflowMode.trim,
            ),
          )
        ]);
  }
}
