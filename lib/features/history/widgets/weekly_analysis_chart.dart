import 'package:easy_localization/easy_localization.dart';
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
  const WeeklyAnalysisChart({super.key,required this.cubit});
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
    bool appMode=AppModeCubit.get(context).isDark;

    return Column(
      children: [
        SizedBox(
          height: context.deviceHeight * 0.7,
          child: SfCartesianChart(
              enableAxisAnimation: true,
              primaryXAxis:   CategoryAxis(
                labelStyle: const TextStyle(fontSize: 20),
                title: AxisTitle(text: 'Week'.tr(),  textStyle: TextStyle(
                    color:appMode?DarkColors.textColor: LightColors.textColor

                )),
                majorGridLines: const MajorGridLines(width: 2),
                majorTickLines: const MajorTickLines(width: 0),
              ),
              primaryYAxis:   NumericAxis(
                title: AxisTitle(
                    text: 'The number of repetitions of the emotion'.tr(),
                 textStyle: TextStyle(
                color:appMode?DarkColors.textColor: LightColors.textColor

                )
                ),
              ),
              title:   ChartTitle(text: 'Weekly Emotions Analysis'.tr(),
                  textStyle: TextStyle(
                      color:appMode?DarkColors.textColor: LightColors.textColor

                  )
              ),
              series: <CartesianSeries>[
                ColumnSeries<BarChartData, String>(
                    color: Colors.amber,
                    dataSource: widget.cubit.chartData,
                    xValueMapper: (BarChartData data, _) =>
                        data.barTitle.toString().tr(),
                    yValueMapper: (BarChartData data, _) => data.happy),
                ColumnSeries<BarChartData, String>(

                    color: Colors.red,
                    dataSource: widget.cubit.chartData,
                    xValueMapper: (BarChartData data, _) =>
                        data.barTitle.toString().tr(),
                    yValueMapper: (BarChartData data, _) =>
                    data.angry),
                ColumnSeries<BarChartData, String>(
                    color: Colors.blue,
                    dataSource: widget.cubit.chartData,
                    xValueMapper: (BarChartData data, _) =>
                        data.barTitle.toString().tr(),
                    yValueMapper: (BarChartData data, _) =>
                    data.surprised),

              ]),
        ),

        const BuildChartMap(),

      ],
    );
  }
}
