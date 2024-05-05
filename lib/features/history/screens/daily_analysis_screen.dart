import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_emotion_recognition_project/core/constants/dark_theme_colors.dart';
import 'package:speech_emotion_recognition_project/core/constants/light_theme_colors.dart';
import '../../../modes_controller/modes_cubit.dart';
import '../../share/model/followed_model.dart';
import '../controller/day_cubit/daily_cubit.dart';
import '../widgets/chart_map.dart';
import '../widgets/daily_analysis_chart.dart';

class DailyAnalysisScreen extends StatelessWidget {
  const DailyAnalysisScreen({super.key,  this.model,  required this.forDisplaySharing});
  final FollowedModel? model;
  final bool forDisplaySharing;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocProvider(
        create: (context) => DailyCubit(forDisplaySharing:forDisplaySharing ,model:model )..getDailyData(),
        child: BlocBuilder<DailyCubit, DayState>(
          builder: (context, state) {
            DailyCubit cubit = DailyCubit.get(context);
            bool appMode = AppModeCubit.get(context).isDark;

            return Center(
              child:cubit.dailyModel==null?CircularProgressIndicator(color: appMode?DarkColors.primary:LightColors.primary,) :Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DailyAnalysisChart(
                    dataSource: cubit.chartData,
                  ),
                  const BuildChartMap(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
