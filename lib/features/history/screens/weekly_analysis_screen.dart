import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/features/history/controller/week_cubit/week_cubit.dart';
import 'package:speech_emotion_recognition_project/features/history/widgets/chart_map.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/bar_chart_data.dart';
import '../widgets/weekly_analysis_chart.dart';

class WeeklyAnalysisScreen extends StatelessWidget {
  WeeklyAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocProvider(
        create: (context) => WeekCubit()..getWeeklyData(),
        child: BlocBuilder<WeekCubit, WeekState>(
          builder: (context, state) {
            WeekCubit cubit = WeekCubit.get(context);
            return WeeklyAnalysisChart(cubit: cubit,);
          },
        ),
      ),
    );
  }
}
