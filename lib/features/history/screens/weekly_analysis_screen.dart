import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_emotion_recognition_project/core/constants/dark_theme_colors.dart';
import 'package:speech_emotion_recognition_project/core/constants/light_theme_colors.dart';
import 'package:speech_emotion_recognition_project/features/history/controller/week_cubit/week_cubit.dart';

import '../../../modes_controller/modes_cubit.dart';
import '../../share/model/followed_model.dart';
import '../widgets/cong_dialog.dart';
import '../widgets/weekly_analysis_chart.dart';

class WeeklyAnalysisScreen extends StatelessWidget {
 const WeeklyAnalysisScreen({super.key, required this.forDisplaySharing,this.model });
 final bool forDisplaySharing;
 final FollowedModel? model;
  @override
  Widget build(BuildContext context1) {
    return Expanded(
      child: BlocProvider(
        lazy: true,
        create: (context) => WeekCubit(forDisplaySharing:forDisplaySharing ,model:model)..getWeeklyData(),
        child: BlocBuilder<WeekCubit, WeekState>(
          builder: (context, state) {
            WeekCubit cubit = WeekCubit.get(context);
            bool appMode = AppModeCubit.get(context).isDark;

            return cubit.weeklyModel == null
                ? Center(
                    child: CircularProgressIndicator(
                      color: appMode ? DarkColors.primary : LightColors.primary,
                    ),
                  )
                : WeeklyAnalysisChart(
                    cubit: cubit,
                  );
          },
        ),
      ),
    );
  }
}
