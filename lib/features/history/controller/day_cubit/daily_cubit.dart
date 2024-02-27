
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/bar_chart_data.dart';
import '../../screens/daily_analysis_screen.dart';

part 'day_state.dart';

class DailyCubit extends Cubit<DayState> {
  DailyCubit() : super(DayInitial());
  static DailyCubit get(context) => BlocProvider.of(context);
  final List<PieChartData> chartData = [

  ];
 Map testMap ={
   'happy': 6,
   'angry': 10,
   'surprised': 10,

 };
getDailyData(){
  chartData.add(PieChartData('happy',testMap['happy'],Colors.amber));
  chartData.add(PieChartData('angry',testMap['angry'],Colors.red));
   chartData.add(PieChartData('surprised',testMap['surprised'],Colors.blue));

  emit(GetDailyState());

}


}
