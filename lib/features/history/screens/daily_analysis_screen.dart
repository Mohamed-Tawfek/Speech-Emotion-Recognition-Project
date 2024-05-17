import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/core/constants/dark_theme_colors.dart';
import 'package:speech_emotion_recognition_project/core/constants/light_theme_colors.dart';
import 'package:speech_emotion_recognition_project/features/history/models/daily_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../modes_controller/modes_cubit.dart';
import '../../share/model/followed_model.dart';
import '../controller/day_cubit/daily_cubit.dart';
import '../models/bar_chart_data.dart';
import '../widgets/chart_map.dart';
import '../widgets/daily_analysis_chart.dart';

class DailyAnalysisScreen extends StatelessWidget {
  const DailyAnalysisScreen(
      {super.key, this.model, required this.forDisplaySharing});
  final FollowedModel? model;
  final bool forDisplaySharing;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocProvider(
        create: (context) =>
            DailyCubit(forDisplaySharing: forDisplaySharing, model: model)
              ..getDailyData(),
        child: BlocBuilder<DailyCubit, DayState>(
          builder: (context, state) {
            DailyCubit cubit = DailyCubit.get(context);
            bool appMode = AppModeCubit.get(context).isDark;
            DailyModel? dailyModel = cubit.dailyModel;
            int? sumEmotions;
            if (dailyModel != null) {
              sumEmotions = dailyModel.surprised;
              sumEmotions = sumEmotions + dailyModel.disgusted;
              sumEmotions = sumEmotions + dailyModel.fear;
              sumEmotions = sumEmotions + dailyModel.sad;
              sumEmotions = sumEmotions + dailyModel.happy;
              sumEmotions = sumEmotions + dailyModel.calm;
              sumEmotions = sumEmotions + dailyModel.natural;
              sumEmotions = sumEmotions + dailyModel.angry;
            }

            return Center(
                child: dailyModel == null
                    ? CircularProgressIndicator(
                        color:
                            appMode ? DarkColors.primary : LightColors.primary,
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sumEmotions != 0
                              ? DailyAnalysisChart(
                                  dataSource: cubit.chartData,
                                )
                              : SfCircularChart(
                                  tooltipBehavior:
                                      TooltipBehavior(enable: true),
                                  title: ChartTitle(
                                      text: 'Daily Emotions Analysis',
                                      textStyle: TextStyle(
                                          color: appMode
                                              ? DarkColors.textColor
                                              : LightColors.textColor)),
                                  series: <CircularSeries>[
                                      PieSeries<PieChartData, String>(
                                        enableTooltip: true,
                                        dataSource: [
                                          PieChartData(
                                            'Empty',
                                            1,
                                            Color(0xff7D7C84),
                                          ),
                                        ],
                                        pointColorMapper:
                                            (PieChartData data, _) =>
                                                data.color,
                                        xValueMapper: (PieChartData data, _) =>
                                            data.title,
                                        yValueMapper: (PieChartData data, _) =>
                                            data.number,
                                        dataLabelSettings:
                                            const DataLabelSettings(
                                          isVisible: false,
                                          overflowMode: OverflowMode.trim,

                                        ),
                                      )
                                    ]),


                          if(sumEmotions == 0   )
                            Center(
                              child: Text(
                                'Daily statistics are empty',
                                style: TextStyle(
                                  color: appMode
                                      ? DarkColors.textColor
                                      : LightColors.textColor,
                                ),
                              ),
                            ),
SizedBox(height: context.deviceHeight*0.04,),

                                const BuildChartMap(),

                        ],
                      ));
          },
        ),
      ),
    );
  }
}
