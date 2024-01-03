import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';

import '../controller/month_cubit/month_cubit.dart';
import '../widgets/build_selection_bar.dart';
import '../widgets/chart_map.dart';
import '../widgets/monthly_analysis_chart.dart';

class MonthlyAnalysisScreen extends StatelessWidget {
  const MonthlyAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocProvider(
        create: (context) => MonthCubit()..getMonthlyData(),
        child: BlocBuilder<MonthCubit, MonthState>(
          builder: (context, state) {
            MonthCubit cubit = MonthCubit.get(context);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MonthlyAnalysisChart(dataSource: cubit.chartData),
                const BuildChartMap(),
                SizedBox(
                  height: context.deviceHeight * 0.04,
                ),
                BuildSelectionBar(
                  cubit: cubit,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
