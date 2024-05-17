import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
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
                          cubit.numberDailyEmotions != 0
                              ? DailyAnalysisChart(
                                  dataSource: cubit.chartData,
                                  totalEmotionsNumber:
                                      cubit.numberDailyEmotions,
                                )
                              : Center(
                                child: Lottie.asset(
                                    'assets/lotties/emotions/empty.json',
                                                          height: context.deviceHeight*0.3,
                                                            width: context.deviceWidth*0.7


                                                          ),
                              ),
                          if (cubit.numberDailyEmotions == 0)
                          SizedBox(
                            height: context.deviceHeight * 0.04,
                          ),
                          if (cubit.numberDailyEmotions == 0)
                            Center(
                              child:
                                AnimatedTextKit(
                                  isRepeatingAnimation: false,
                                  animatedTexts: [
                                    TypewriterAnimatedText('Daily statistics are empty',
                                        cursor: '',
                                        textStyle: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                            color: appMode
                                                ? DarkColors.textColor
                                                : LightColors.textColor),
                                        speed: Duration(milliseconds: 100)),
                                  ],
                                )
                            ),
                          SizedBox(
                            height: context.deviceHeight * 0.04,
                          ),

                          if (cubit.numberDailyEmotions != 0)
                          const BuildChartMap(),
                        ],
                      ));
          },
        ),
      ),
    );
  }
}
