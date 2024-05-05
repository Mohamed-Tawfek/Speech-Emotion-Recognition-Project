import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:speech_emotion_recognition_project/core/constants/api_constants.dart';
import 'package:speech_emotion_recognition_project/core/helpers/dio_helper.dart';
import 'package:speech_emotion_recognition_project/features/history/models/weekly_model.dart';

import '../../../../core/helpers/cash_helper.dart';
import '../../../share/model/followed_model.dart';
import '../../models/bar_chart_data.dart';
import '../../widgets/cong_dialog.dart';

part 'week_state.dart';

class WeekCubit extends Cubit<WeekState> {
  WeekCubit({required this.forDisplaySharing,this.model}) : super(WeekInitial());
  static WeekCubit get(context) => BlocProvider.of(context, listen: false);
  bool forDisplaySharing;
  FollowedModel? model;
  List<BarChartData> chartData = [];
  WeeklyModel? weeklyModel;
  getWeeklyData() {
    emit(GetWeeklyBarDataLoadingState());
    String userID =forDisplaySharing?model!.userID: CashHelper.getData(key: 'userID');
    String token =forDisplaySharing?model!.token: CashHelper.getData(key: 'token');

    DioHelper.get(
        url: '${ApiConstants.weeklyHistoryEndPoint}$userID',
        headers: {'token': token}).then((value) {
      weeklyModel = WeeklyModel.fromJson(value.data);
      chartData.add(BarChartData(
        'First',
        weeklyModel!.first.happy,
        weeklyModel!.first.angry,
        weeklyModel!.first.surprised,
      ));
      chartData.add(BarChartData(
        'Second',
        weeklyModel!.second.happy,
        weeklyModel!.second.angry,
        weeklyModel!.second.surprised,
      ));
      chartData.add(BarChartData(
        'Third',
        weeklyModel!.third.happy,
        weeklyModel!.third.angry,
        weeklyModel!.third.surprised,
      ));
      chartData.add(BarChartData(
        'Fourth',
        weeklyModel!.fourth.happy,
        weeklyModel!.fourth.angry,
        weeklyModel!.fourth.surprised,
      ));

      emit(GetWeeklyBarDataSuccessState());
    }).catchError((e) {
      debugPrint('='*20);
      debugPrint(e.toString());
      debugPrint('='*20);
      emit(GetWeeklyBarDataErrorState());

    });
  }

  void showCongMessage(BuildContext context) {
    showCongDialog(context);
  }
}
