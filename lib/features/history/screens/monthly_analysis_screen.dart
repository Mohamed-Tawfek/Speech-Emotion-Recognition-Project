import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';

import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';
import '../../../modes_controller/modes_cubit.dart';
import '../../share/model/followed_model.dart';
import '../controller/month_cubit/month_cubit.dart';
import '../widgets/build_selection_bar.dart';
import '../widgets/chart_map.dart';
import '../widgets/monthly_analysis_chart.dart';

class MonthlyAnalysisScreen extends StatelessWidget {
  const MonthlyAnalysisScreen({super.key, required this.forDisplaySharing,this.model });
 final bool forDisplaySharing;
 final FollowedModel? model;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocProvider(
        create: (context) => MonthCubit(forDisplaySharing:forDisplaySharing ,model:model)..getMonthlyData(),
        child: BlocBuilder<MonthCubit, MonthState>(
          builder: (context, state) {
            MonthCubit cubit = MonthCubit.get(context);
            bool appMode = AppModeCubit.get(context).isDark;

            return cubit.monthlyModel == null
                ? Center(
                    child: CircularProgressIndicator(
                      color: appMode ? DarkColors.primary : LightColors.primary,
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: MonthlyAnalysisChart(
                              dataSource: cubit.chartData)),
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
