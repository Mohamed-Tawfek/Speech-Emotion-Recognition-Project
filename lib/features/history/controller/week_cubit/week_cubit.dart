import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/bar_chart_data.dart';
import '../../widgets/cong_dialog.dart';

part 'week_state.dart';

class WeekCubit extends Cubit<WeekState> {
  WeekCubit() : super(WeekInitial());
  static WeekCubit get(context) => BlocProvider.of(context,listen: false);

  Map? weekChartData;

  List<BarChartData> chartData = [];
  getWeeklyData() {
    weekChartData = weekData;

    chartData.add(BarChartData(
      weekChartData?.keys.toList()[0],
      weekChartData?['First']['happy'],
      weekChartData?['First']['angry'],
      weekChartData?['First']['surprised'],
    ));
    chartData.add(BarChartData(
      weekChartData?.keys.toList()[1],
      weekChartData?['Second']['happy'],
      weekChartData?['Second']['angry'],
      weekChartData?['Second']['surprised'],
    ));
    chartData.add(BarChartData(
      weekChartData?.keys.toList()[2],
      weekChartData?['Third']['happy'],
      weekChartData?['Third']['angry'],
      weekChartData?['Third']['surprised'],
    ));
    chartData.add(BarChartData(
      weekChartData?.keys.toList()[3],
      weekChartData?['Fourth']['happy'],
      weekChartData?['Fourth']['angry'],
      weekChartData?['Fourth']['surprised'],
    ));

   emit(GetWeeklyBarDataState());
  }

 void showCongMessage(BuildContext context){
    showCongDialog(context);
  }
}

Map weekData = {
  'First': {
    'happy': 15,
    'angry': 9,
    'surprised': 5,
  },
  'Second': {
    'happy': 10,
    'angry': 15,
    'surprised': 10,
  },
  'Third': {
    'happy': 7,
    'angry': 13,
    'surprised': 17,
  },
  'Fourth': {
    'happy': 6,
    'angry': 15,
    'surprised': 8,
  },
};
