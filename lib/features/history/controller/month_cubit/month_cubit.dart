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


    setupChartData();

    emit(ChangeSelectedMonthState());
  }

  void setupChartData() {
    chartData.clear();

    if (selectionPart == 1) {
      chartData.add(BarChartData(
          monthsChartData?.keys.toList()[0],
          monthsChartData?['Jan']['happy'],
          monthsChartData?['Jan']['angry'],
          monthsChartData?['Jan']['surprised'],
        ));
      chartData.add(BarChartData(
          monthsChartData?.keys.toList()[1],
          monthsChartData?['Feb']['happy'],
          monthsChartData?['Feb']['angry'],
          monthsChartData?['Feb']['surprised'],
      ));
      chartData.add(BarChartData(
          monthsChartData?.keys.toList()[2],
          monthsChartData?['Mar']['happy'],
          monthsChartData?['Mar']['angry'],
          monthsChartData?['Mar']['surprised'],
           ));
      chartData.add(BarChartData(
          monthsChartData?.keys.toList()[3],
          monthsChartData?['Apr']['happy'],
          monthsChartData?['Apr']['angry'],
          monthsChartData?['Apr']['surprised'],
     ));
    }
    if (selectionPart == 2) {
      chartData.add(BarChartData(
          monthsChartData?.keys.toList()[4],
          monthsChartData?['May']['happy'],
          monthsChartData?['May']['angry'],
          monthsChartData?['May']['surprised'],
      ));
      chartData.add(BarChartData(
          monthsChartData?.keys.toList()[5],
          monthsChartData?['Jun']['happy'],
          monthsChartData?['Jun']['angry'],
          monthsChartData?['Jun']['surprised'],
         ));
      chartData.add(BarChartData(
          monthsChartData?.keys.toList()[6],
          monthsChartData?['Jul']['happy'],
          monthsChartData?['Jul']['angry'],
          monthsChartData?['Jul']['surprised'],
      ));

      chartData.add(BarChartData(
          monthsChartData?.keys.toList()[7],
          monthsChartData?['Aug']['happy'],
          monthsChartData?['Aug']['angry'],
          monthsChartData?['Aug']['surprised'],
        ));
    }
    if (selectionPart == 3) {
      chartData.add(BarChartData(
          monthsChartData?.keys.toList()[8],
          monthsChartData?['Sep']['happy'],
          monthsChartData?['Sep']['angry'],
          monthsChartData?['Sep']['surprised'],
       ));
      chartData.add(BarChartData(
          monthsChartData?.keys.toList()[9],
          monthsChartData?['Oct']['happy'],
          monthsChartData?['Oct']['angry'],
          monthsChartData?['Oct']['surprised'],
       ));
      chartData.add(BarChartData(
          monthsChartData?.keys.toList()[10],
          monthsChartData?['Nov']['happy'],
          monthsChartData?['Nov']['angry'],
          monthsChartData?['Nov']['surprised'],
          ));
      chartData.add(BarChartData(
          monthsChartData?.keys.toList()[11],
          monthsChartData?['Dec']['happy'],
          monthsChartData?['Dec']['angry'],
          monthsChartData?['Dec']['surprised'],
         ));
    }
  }
}

const Map test = {
  'Jan': {
    'happy': 5,
    'angry': 10,
    'surprised': 14,

  },
  'Feb': {
    'happy': 16,
    'angry': 12,
    'surprised': 7,

  },
  'Mar': {
    'happy': 14,
    'angry': 10,
    'surprised': 7,

  },
  'Apr': {
    'happy': 18,
    'angry': 14,
    'surprised': 10,

  },
  'May': {
    'happy': 7,
    'angry': 13,
    'surprised': 11,
   },
  'Jun': {
    'happy': 6,
    'angry': 10,
    'surprised': 8,
   },
  'Jul': {
    'happy': 12,
    'angry': 7,
    'surprised': 18,
   },
  'Aug': {
    'happy': 15,
    'angry': 9,
    'surprised': 18,
   },
  'Sep': {
    'happy': 10,
    'angry': 19,
    'surprised': 12,
   },
  'Oct': {
    'happy': 18,
    'angry': 11,
    'surprised': 9,
   },
  'Nov': {
    'happy': 9,
    'angry': 15,
    'surprised': 18,
   },
  'Dec': {
    'happy': 9,
    'angry': 15,
    'surprised': 12,

  },
};


