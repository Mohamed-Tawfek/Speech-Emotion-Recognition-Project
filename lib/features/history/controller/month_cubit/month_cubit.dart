import 'dart:math';

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
    // DioHelper.get(
    //     url: '${ApiConstants.monthlyHistoryEndPoint}$userID',
    //     headers: {'token': token}).then((value) {
    //
    //   monthlyModel = MonthlyModel.fromJson(value.data);
    //   setupChartData();
    //   emit(GetMonthlySuccessState());
    // });


    ///////////////-------------------------------
    monthlyModel = MonthlyModel.fromJson(test);
    setupChartData();
    emit(GetMonthlySuccessState());



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
        monthlyModel!.january.fear,
        monthlyModel!.january.sad,
        monthlyModel!.january.calm,
        monthlyModel!.january.natural,
        monthlyModel!.january.disgusted,
      ));
      chartData.add(BarChartData(
        'Feb',
        monthlyModel!.february.happy,
        monthlyModel!.february.angry,
        monthlyModel!.february.surprised,
        monthlyModel!.february.fear,
        monthlyModel!.february.sad,
        monthlyModel!.february.calm,
        monthlyModel!.february.natural,
        monthlyModel!.february.disgusted,
      ));
      chartData.add(BarChartData(
        'Mar',
        monthlyModel!.march.happy,
        monthlyModel!.march.angry,
        monthlyModel!.march.surprised,
        monthlyModel!.march.fear,
        monthlyModel!.march.sad,
        monthlyModel!.march.calm,
        monthlyModel!.march.natural,
        monthlyModel!.march.disgusted,
      ));
      chartData.add(BarChartData(
        'Apr',
        monthlyModel!.april.happy,
        monthlyModel!.april.angry,
        monthlyModel!.april.surprised,
        monthlyModel!.april.fear,
        monthlyModel!.april.sad,
        monthlyModel!.april.calm,
        monthlyModel!.april.natural,
        monthlyModel!.april.disgusted,
      ));
    }
    if (selectionPart == 2) {
      chartData.add(BarChartData(
        'May',
        monthlyModel!.may.happy,
        monthlyModel!.may.angry,
        monthlyModel!.may.surprised,
        monthlyModel!.may.fear,
        monthlyModel!.may.sad,
        monthlyModel!.may.calm,
        monthlyModel!.may.natural,
        monthlyModel!.may.disgusted,
      ));
      chartData.add(BarChartData(
        'Jun',
        monthlyModel!.june.happy,
        monthlyModel!.june.angry,
        monthlyModel!.june.surprised,
        monthlyModel!.june.fear,
        monthlyModel!.june.sad,
        monthlyModel!.june.calm,
        monthlyModel!.june.natural,
        monthlyModel!.june.disgusted,
      ));
      chartData.add(BarChartData(
        'Jul',
        monthlyModel!.july.happy,
        monthlyModel!.july.angry,
        monthlyModel!.july.surprised,
        monthlyModel!.july.fear,
        monthlyModel!.july.sad,
        monthlyModel!.july.calm,
        monthlyModel!.july.natural,
        monthlyModel!.july.disgusted,
      ));

      chartData.add(BarChartData(
        'Aug',
        monthlyModel!.august.happy,
        monthlyModel!.august.angry,
        monthlyModel!.august.surprised,
        monthlyModel!.august.fear,
        monthlyModel!.august.sad,
        monthlyModel!.august.calm,
        monthlyModel!.august.natural,
        monthlyModel!.august.disgusted,
      ));
    }
    if (selectionPart == 3) {
      chartData.add(BarChartData(
        'Sep',
        monthlyModel!.september.happy,
        monthlyModel!.september.angry,
        monthlyModel!.september.surprised,
        monthlyModel!.september.fear,
        monthlyModel!.september.sad,
        monthlyModel!.september.calm,
        monthlyModel!.september.natural,
        monthlyModel!.september.disgusted,
      ));
      chartData.add(BarChartData(
        'Oct',
        monthlyModel!.october.happy,
        monthlyModel!.october.angry,
        monthlyModel!.october.surprised,
        monthlyModel!.october.fear,
        monthlyModel!.october.sad,
        monthlyModel!.october.calm,
        monthlyModel!.october.natural,
        monthlyModel!.october.disgusted,
      ));
      chartData.add(BarChartData(
        'Nov',
        monthlyModel!.november.happy,
        monthlyModel!.november.angry,
        monthlyModel!.november.surprised,
        monthlyModel!.november.fear,
        monthlyModel!.november.sad,
        monthlyModel!.november.calm,
        monthlyModel!.november.natural,
        monthlyModel!.november.disgusted,
      ));
      chartData.add(BarChartData(
        'Dec',
        monthlyModel!.december.happy,
        monthlyModel!.december.angry,
        monthlyModel!.december.surprised,
        monthlyModel!.december.fear,
        monthlyModel!.december.sad,
        monthlyModel!.december.calm,
        monthlyModel!.december.natural,
        monthlyModel!.december.disgusted,
      ));
    }
  }
}

 Map<String,dynamic>  test = {
'Year':{
  'Jan': {
    'happy': Random().nextInt(10),
    'angry': Random().nextInt(10),
    'surprise': Random().nextInt(10),
    'calm': Random().nextInt(10),
    'neutral': Random().nextInt(10),
    'sad': Random().nextInt(10),
    'fear': Random().nextInt(10),
    'disgust': Random().nextInt(10),
  },
  'Feb': {
    'happy': Random().nextInt(10),
    'angry': Random().nextInt(10),
    'surprise': Random().nextInt(10),
    'calm': Random().nextInt(10),
    'neutral': Random().nextInt(10),
    'sad': Random().nextInt(10),
    'fear': Random().nextInt(10),
    'disgust': Random().nextInt(10),
  },
  'Mar': {
    'happy': Random().nextInt(10),
    'angry': Random().nextInt(10),
    'surprise': Random().nextInt(10),
    'calm': Random().nextInt(10),
    'neutral': Random().nextInt(10),
    'sad': Random().nextInt(10),
    'fear': Random().nextInt(10),
    'disgust': Random().nextInt(10),
  },
  'Apr': {
    'happy': Random().nextInt(10),
    'angry': Random().nextInt(10),
    'surprise': Random().nextInt(10),
    'calm': Random().nextInt(10),
    'neutral': Random().nextInt(10),
    'sad': Random().nextInt(10),
    'fear': Random().nextInt(10),
    'disgust': Random().nextInt(10),
  },
  'May': {
    'happy': Random().nextInt(10),
    'angry': Random().nextInt(10),
    'surprise': Random().nextInt(10),
    'calm': Random().nextInt(10),
    'neutral': Random().nextInt(10),
    'sad': Random().nextInt(10),
    'fear': Random().nextInt(10),
    'disgust': Random().nextInt(10),
  },
  'Jun': {
    'happy': Random().nextInt(10),
    'angry': Random().nextInt(10),
    'surprise': Random().nextInt(10),
    'calm': Random().nextInt(10),
    'neutral': Random().nextInt(10),
    'sad': Random().nextInt(10),
    'fear': Random().nextInt(10),
    'disgust': Random().nextInt(10),
  },
  'Jul': {
    'happy': Random().nextInt(10),
    'angry': Random().nextInt(10),
    'surprise': Random().nextInt(10),
    'calm': Random().nextInt(10),
    'neutral': Random().nextInt(10),
    'sad': Random().nextInt(10),
    'fear': Random().nextInt(10),
    'disgust': Random().nextInt(10),
  },
  'Aug': {
    'happy': Random().nextInt(10),
    'angry': Random().nextInt(10),
    'surprise': Random().nextInt(10),
    'calm': Random().nextInt(10),
    'neutral': Random().nextInt(10),
    'sad': Random().nextInt(10),
    'fear': Random().nextInt(10),
    'disgust': Random().nextInt(10),
  },
  'Sep': {
    'happy': Random().nextInt(10),
    'angry': Random().nextInt(10),
    'surprise': Random().nextInt(10),
    'calm': Random().nextInt(10),
    'neutral': Random().nextInt(10),
    'sad': Random().nextInt(10),
    'fear': Random().nextInt(10),
    'disgust': Random().nextInt(10),
  },
  'Oct': {
    'happy': Random().nextInt(10),
    'angry': Random().nextInt(10),
    'surprise': Random().nextInt(10),
    'calm': Random().nextInt(10),
    'neutral': Random().nextInt(10),
    'sad': Random().nextInt(10),
    'fear': Random().nextInt(10),
    'disgust': Random().nextInt(10),
  },
  'Nov': {
    'happy': Random().nextInt(10),
    'angry': Random().nextInt(10),
    'surprise': Random().nextInt(10),
    'calm': Random().nextInt(10),
    'neutral': Random().nextInt(10),
    'sad': Random().nextInt(10),
    'fear': Random().nextInt(10),
    'disgust': Random().nextInt(10),
  },
  'Dec': {
    'happy': Random().nextInt(10),
    'angry': Random().nextInt(10),
    'surprise': Random().nextInt(10),
    'calm': Random().nextInt(10),
    'neutral': Random().nextInt(10),
    'sad': Random().nextInt(10),
    'fear': Random().nextInt(10),
    'disgust': Random().nextInt(10),
  },
}
};
