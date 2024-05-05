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
  DailyCubit({required this.forDisplaySharing,this.model}) : super(DayInitial());
  static DailyCubit get(context) => BlocProvider.of(context);
  DailyModel? dailyModel;
  final List<PieChartData> chartData = [];
  bool forDisplaySharing;
  FollowedModel? model;
  // Map testMap ={
  //   'happy': 6,
  //   'angry': 10,
  //   'surprised': 10,
  //
  // };
  getDailyData() {
    emit(GetDailyStateLoading());
    String userID =forDisplaySharing?model!.userID: CashHelper.getData(key: 'userID');
    String token =forDisplaySharing?model!.token: CashHelper.getData(key: 'token');
    DioHelper.get(
        url: '${ApiConstants.dailyHistoryEndPoint}$userID',
        headers: {'token': token}).then((value) {
      dailyModel = DailyModel.fromJson(value.data);
      chartData.add(PieChartData('happy', dailyModel!.happy, Colors.amber));
      chartData.add(PieChartData('angry', dailyModel!.angry, Colors.red));
      chartData
          .add(PieChartData('surprised', dailyModel!.surprised, Colors.blue));
      emit(GetDailyStateSuccess());
    }).catchError((e) {
      emit(GetDailyStateError());
    });
  }
}
