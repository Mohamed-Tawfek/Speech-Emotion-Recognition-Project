import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/bar_chart_data.dart';

part 'week_state.dart';

class WeekCubit extends Cubit<WeekState> {
  WeekCubit() : super(WeekInitial());
  static WeekCubit get(context) => BlocProvider.of(context);

  Map? weekChartData;

  List<BarChartData> chartData = [];
  getWeeklyData() {
    weekChartData = weekData;

    chartData.add(BarChartData(
        weekChartData?.keys.toList()[0],
        weekChartData?['First']['happy'],
        weekChartData?['First']['angery'],
        weekChartData?['First']['normal'],
        weekChartData?['First']['sad']));
    chartData.add(BarChartData(
        weekChartData?.keys.toList()[1],
        weekChartData?['Second']['happy'],
        weekChartData?['Second']['angery'],
        weekChartData?['Second']['normal'],
        weekChartData?['Second']['sad']));
    chartData.add(BarChartData(
        weekChartData?.keys.toList()[2],
        weekChartData?['Third']['happy'],
        weekChartData?['Third']['angery'],
        weekChartData?['Third']['normal'],
        weekChartData?['Third']['sad']));
    chartData.add(BarChartData(
        weekChartData?.keys.toList()[3],
        weekChartData?['Fourth']['happy'],
        weekChartData?['Fourth']['angery'],
        weekChartData?['Fourth']['normal'],
        weekChartData?['Fourth']['sad']));

    emit(GetWeeklyBarDataState());
  }
}

Map weekData = {
  'First': {
    'happy': 9,
    'angery': 15,
    'normal': 12,
    'sad': 19,
  },
  'Second': {
    'happy': 10,
    'angery': 8,
    'normal': 12,
    'sad': 19,
  },
  'Third': {
    'happy': 7,
    'angery': 13,
    'normal': 17,
    'sad': 5,
  },
  'Fourth': {
    'happy': 6,
    'angery': 15,
    'normal': 8,
    'sad': 19,
  },
};
