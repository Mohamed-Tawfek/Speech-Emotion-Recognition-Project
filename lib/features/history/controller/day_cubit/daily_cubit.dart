import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:speech_emotion_recognition_project/core/constants/api_constants.dart';
import 'package:speech_emotion_recognition_project/core/helpers/cash_helper.dart';
import 'package:speech_emotion_recognition_project/core/helpers/dio_helper.dart';

import '../../../share/model/followed_model.dart';
import '../../models/bar_chart_data.dart';
import '../../models/daily_model.dart';
import '../../screens/daily_analysis_screen.dart';

part 'day_state.dart';

class DailyCubit extends Cubit<DayState> {
  DailyCubit({required this.forDisplaySharing, this.model})
      : super(DayInitial());
  static DailyCubit get(context) => BlocProvider.of(context);
  DailyModel? dailyModel;
  final List<PieChartData> chartData = [];
  int numberDailyEmotions = 0;

  bool forDisplaySharing;
  FollowedModel? model;
  // Map testMap ={
  //   'happy': 6,
  //   'angry': 10,
  //   'surprised': 10,
  //
  // };
  calcNumberDailyEmotions() {
    if (dailyModel != null) {
      numberDailyEmotions = dailyModel!.surprised;
      numberDailyEmotions = numberDailyEmotions + dailyModel!.disgusted;
      numberDailyEmotions = numberDailyEmotions + dailyModel!.fear;
      numberDailyEmotions = numberDailyEmotions + dailyModel!.sad;
      numberDailyEmotions = numberDailyEmotions + dailyModel!.happy;
      numberDailyEmotions = numberDailyEmotions + dailyModel!.calm;
      numberDailyEmotions = numberDailyEmotions + dailyModel!.natural;
      numberDailyEmotions = numberDailyEmotions + dailyModel!.angry;
    }
  }

  getDailyData() {
    emit(GetDailyStateLoading());
    String userID =
        forDisplaySharing ? model!.userID : CashHelper.getData(key: 'userID');
    String token =
        forDisplaySharing ? model!.token : CashHelper.getData(key: 'token');
    DioHelper.get(
        url: '${ApiConstants.dailyHistoryEndPoint}$userID',
        headers: {'token': token}).then((value) {
      dailyModel = DailyModel.fromJson(value.data);
      print(value.data);
      print(dailyModel!.angry);
      print(dailyModel!.sad);

      calcNumberDailyEmotions();
      // dailyModel = DailyModel.fromJson({
      //   'Day':{
      //     'Angry':2,
      //     'Happy':1,
      //     'Surprise':7,
      //     'Neutral':7,
      //     'Calm':4,
      //     'Sad':4,
      //     'Fear':6,
      //     'Disgust':7
      //
      //   }
      // });
      chartData.add(PieChartData(
          'Natural', dailyModel!.natural, const Color(0xffCFD8DC)));
      chartData.add(PieChartData('Calm', dailyModel!.calm, Color(0xff00BEFF)));
      chartData
          .add(PieChartData('Happy', dailyModel!.happy, Color(0xffFFEB00)));
      chartData.add(PieChartData('Sad', dailyModel!.sad, Color(0xff0057AE)));
      chartData
          .add(PieChartData('Angry', dailyModel!.angry, Color(0xffFF2414)));
      chartData.add(PieChartData('Fear', dailyModel!.fear, Color(0xffB7043C)));
      chartData.add(
          PieChartData('Disgusted', dailyModel!.disgusted, Color(0xffA1E533)));
      chartData.add(
          PieChartData('Surprised', dailyModel!.surprised, Color(0xffFF6900)));

      emit(GetDailyStateSuccess());
    }).catchError((e) {
      emit(GetDailyStateError());
    });

    // //-------------------------
    // // dailyModel = DailyModel.fromJson({
    // //   'Day':{
    // //     'Angry':2,
    // //     'Happy':1,
    // //     'Surprise':2,
    // //     'Neutral':3,
    // //     'Calm':3,
    // //     'Sad':3,
    // //     'Fear':3,
    // //     'Disgust':3
    // //
    // //   }
    // // });
    // chartData.add(PieChartData(
    //     'Natural', dailyModel!.natural, const Color(0xffCFD8DC)));
    // chartData.add(PieChartData('Calm', dailyModel!.calm, Color(0xff00BEFF)));
    // chartData
    //     .add(PieChartData('Happy', dailyModel!.happy, Color(0xffFFEB00)));
    // chartData.add(PieChartData('Sad', dailyModel!.sad, Color(0xff0057AE)));
    // chartData
    //     .add(PieChartData('Angry', dailyModel!.angry, Color(0xffFF2414)));
    // chartData.add(PieChartData('Fear', dailyModel!.fear, Color(0xffB7043C)));
    // chartData.add(
    //     PieChartData('Disgusted', dailyModel!.disgusted, Color(0xffA1E533)));
    // chartData.add(
    //     PieChartData('Surprised', dailyModel!.surprised, Color(0xffFF6900)));
  }
}
