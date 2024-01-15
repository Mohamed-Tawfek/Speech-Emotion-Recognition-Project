import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/bar_chart_data.dart';

part 'month_state.dart';

class MonthCubit extends Cubit<MonthState> {
  MonthCubit() : super(MonthInitial());
  Map? monthsChartData;
  int selectionPart = 1;
  List<BarChartData> chartData = [];

  getMonthlyData() {
    monthsChartData = test;
    setupChartData();
  }

  static MonthCubit get(context) => BlocProvider.of(context);

  changeSelectionInMonth(int index) {
    selectionPart = index;
    print(index);

    setupChartData();
    print(chartData[0].sad);
    emit(ChangeSelectedMonthState());
  }

  void setupChartData() {
    chartData.clear();

    if (selectionPart == 1) {
      chartData.add(BarChartData(
          monthsChartData?.keys.toList()[0],
          monthsChartData?['Jan']['happy'],
          monthsChartData?['Jan']['angery'],
          monthsChartData?['Jan']['normal'],
          monthsChartData?['Jan']['sad']));
      chartData.add(BarChartData(
          monthsChartData?.keys.toList()[1],
          monthsChartData?['Feb']['happy'],
          monthsChartData?['Feb']['angery'],
          monthsChartData?['Feb']['normal'],
          monthsChartData?['Feb']['sad']));
      chartData.add(BarChartData(
          monthsChartData?.keys.toList()[2],
          monthsChartData?['Mar']['happy'],
          monthsChartData?['Mar']['angery'],
          monthsChartData?['Mar']['normal'],
          monthsChartData?['Mar']['sad']));
      chartData.add(BarChartData(
          monthsChartData?.keys.toList()[3],
          monthsChartData?['Apr']['happy'],
          monthsChartData?['Apr']['angery'],
          monthsChartData?['Apr']['normal'],
          monthsChartData?['Apr']['sad']));
    }
    if (selectionPart == 2) {
      chartData.add(BarChartData(
          monthsChartData?.keys.toList()[4],
          monthsChartData?['May']['happy'],
          monthsChartData?['May']['angery'],
          monthsChartData?['May']['normal'],
          monthsChartData?['May']['sad']));
      chartData.add(BarChartData(
          monthsChartData?.keys.toList()[5],
          monthsChartData?['Jun']['happy'],
          monthsChartData?['Jun']['angery'],
          monthsChartData?['Jun']['normal'],
          monthsChartData?['Jun']['sad']));
      chartData.add(BarChartData(
          monthsChartData?.keys.toList()[6],
          monthsChartData?['Jul']['happy'],
          monthsChartData?['Jul']['angery'],
          monthsChartData?['Jul']['normal'],
          monthsChartData?['Jul']['sad']));

      chartData.add(BarChartData(
          monthsChartData?.keys.toList()[7],
          monthsChartData?['Aug']['happy'],
          monthsChartData?['Aug']['angery'],
          monthsChartData?['Aug']['normal'],
          monthsChartData?['Aug']['sad']));
    }
    if (selectionPart == 3) {
      chartData.add(BarChartData(
          monthsChartData?.keys.toList()[8],
          monthsChartData?['Sep']['happy'],
          monthsChartData?['Sep']['angery'],
          monthsChartData?['Sep']['normal'],
          monthsChartData?['Sep']['sad']));
      chartData.add(BarChartData(
          monthsChartData?.keys.toList()[9],
          monthsChartData?['Oct']['happy'],
          monthsChartData?['Oct']['angery'],
          monthsChartData?['Oct']['normal'],
          monthsChartData?['Oct']['sad']));
      chartData.add(BarChartData(
          monthsChartData?.keys.toList()[10],
          monthsChartData?['Nov']['happy'],
          monthsChartData?['Nov']['angery'],
          monthsChartData?['Nov']['normal'],
          monthsChartData?['Nov']['sad']));
      chartData.add(BarChartData(
          monthsChartData?.keys.toList()[11],
          monthsChartData?['Dec']['happy'],
          monthsChartData?['Dec']['angery'],
          monthsChartData?['Dec']['normal'],
          monthsChartData?['Dec']['sad']));
    }
  }
}

const Map test = {
  'Jan': {
    'happy': 5,
    'angery': 10,
    'normal': 14,
    'sad': 8,
  },
  'Feb': {
    'happy': 16,
    'angery': 12,
    'normal': 7,
    'sad': 9,
  },
  'Mar': {
    'happy': 14,
    'angery': 10,
    'normal': 7,
    'sad': 4,
  },
  'Apr': {
    'happy': 18,
    'angery': 14,
    'normal': 10,
    'sad': 9,
  },
  'May': {
    'happy': 7,
    'angery': 13,
    'normal': 11,
    'sad': 7,
  },
  'Jun': {
    'happy': 6,
    'angery': 10,
    'normal': 8,
    'sad': 18,
  },
  'Jul': {
    'happy': 12,
    'angery': 7,
    'normal': 18,
    'sad': 12,
  },
  'Aug': {
    'happy': 15,
    'angery': 9,
    'normal': 18,
    'sad': 14,
  },
  'Sep': {
    'happy': 10,
    'angery': 19,
    'normal': 12,
    'sad': 8,
  },
  'Oct': {
    'happy': 18,
    'angery': 11,
    'normal': 9,
    'sad': 14,
  },
  'Nov': {
    'happy': 9,
    'angery': 15,
    'normal': 18,
    'sad': 12,
  },
  'Dec': {
    'happy': 9,
    'angery': 15,
    'normal': 12,
    'sad': 19,
  },
};


