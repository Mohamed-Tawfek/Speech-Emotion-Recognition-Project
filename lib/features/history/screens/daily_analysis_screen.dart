import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/day_cubit/daily_cubit.dart';
import '../widgets/chart_map.dart';
import '../widgets/daily_analysis_chart.dart';

class DailyAnalysisScreen extends StatelessWidget {
  const DailyAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocProvider(
        create: (context) => DailyCubit()..getDailyData(),
        child: BlocBuilder<DailyCubit, DayState>(
          builder: (context, state) {
            DailyCubit cubit = DailyCubit.get(context);

            return Center(
              child: Column(
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
