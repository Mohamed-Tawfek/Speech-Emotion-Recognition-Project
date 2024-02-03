
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
   'angery': 10,
   'normal': 15,
   'sad': 7,
 };
getDailyData(){
  chartData.add(PieChartData('happy',testMap['happy'],Colors.yellow));
  chartData.add(PieChartData('angery',testMap['angery'],Colors.red));
  chartData.add(PieChartData('normal',testMap['normal'],Colors.green));
  chartData.add(PieChartData('sad',testMap['sad'],Colors.purple));

  emit(GetDailyState());

}


}
