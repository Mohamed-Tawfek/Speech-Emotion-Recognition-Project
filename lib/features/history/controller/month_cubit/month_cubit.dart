import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:speech_emotion_recognition_project/core/constants/api_constants.dart';
import 'package:speech_emotion_recognition_project/core/helpers/dio_helper.dart';

import '../../../../core/helpers/cash_helper.dart';
import '../../../share/model/followed_model.dart';
import '../../models/bar_chart_data.dart';
import '../../models/monthly_model.dart';

part 'month_state.dart';

class MonthCubit extends Cubit<MonthState> {
  MonthCubit({required this.forDisplaySharing, this.model})
      : super(MonthInitial());
  bool forDisplaySharing;
  FollowedModel? model;
  Map? monthsChartData;
  int selectionPart = 1;
  List<BarChartData> chartData = [];
  MonthlyModel? monthlyModel;
  static MonthCubit get(context) => BlocProvider.of(context);
  getMonthlyData() {
    emit(GetMonthlyLoadingState());
    monthsChartData = test;
    String userID =
        forDisplaySharing ? model!.userID : CashHelper.getData(key: 'userID');
    String token =
        forDisplaySharing ? model!.token : CashHelper.getData(key: 'token');
    DioHelper.get(
        url: '${ApiConstants.monthlyHistoryEndPoint}$userID',
        headers: {'token': token}).then((value) {
      monthlyModel = MonthlyModel.fromJson(value.data);
      setupChartData();
      emit(GetMonthlySuccessState());
    });
  }

  changeSelectionInMonth(int index) {
    selectionPart = index;

    setupChartData();

    emit(ChangeSelectedMonthState());
  }

  void setupChartData() {
    chartData.clear();

    if (selectionPart == 1) {
      chartData.add(BarChartData(
        'Jan',
        monthlyModel!.january.happy,
        monthlyModel!.january.angry,
        monthlyModel!.january.surprised,
      ));
      chartData.add(BarChartData(
        'Feb',
        monthlyModel!.february.happy,
        monthlyModel!.february.angry,
        monthlyModel!.february.surprised,
      ));
      chartData.add(BarChartData(
        'Mar',
        monthlyModel!.march.happy,
        monthlyModel!.march.angry,
        monthlyModel!.march.surprised,
      ));
      chartData.add(BarChartData(
        'Apr',
        monthlyModel!.april.happy,
        monthlyModel!.april.angry,
        monthlyModel!.april.surprised,
      ));
    }
    if (selectionPart == 2) {
      chartData.add(BarChartData(
        'May',
        monthlyModel!.may.happy,
        monthlyModel!.may.angry,
        monthlyModel!.may.surprised,
      ));
      chartData.add(BarChartData(
        'Jun',
        monthlyModel!.june.happy,
        monthlyModel!.june.angry,
        monthlyModel!.june.surprised,
      ));
      chartData.add(BarChartData(
        'Jul',
        monthlyModel!.july.happy,
        monthlyModel!.july.angry,
        monthlyModel!.july.surprised,
      ));

      chartData.add(BarChartData(
        'Aug',
        monthlyModel!.august.happy,
        monthlyModel!.august.angry,
        monthlyModel!.august.surprised,
      ));
    }
    if (selectionPart == 3) {
      chartData.add(BarChartData(
        'Sep',
        monthlyModel!.september.happy,
        monthlyModel!.september.angry,
        monthlyModel!.september.surprised,
      ));
      chartData.add(BarChartData(
        'Oct',
        monthlyModel!.october.happy,
        monthlyModel!.october.angry,
        monthlyModel!.october.surprised,
      ));
      chartData.add(BarChartData(
        'Nov',
        monthlyModel!.november.happy,
        monthlyModel!.november.angry,
        monthlyModel!.november.surprised,
      ));
      chartData.add(BarChartData(
        'Dec',
        monthlyModel!.december.happy,
        monthlyModel!.december.angry,
        monthlyModel!.december.surprised,
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
