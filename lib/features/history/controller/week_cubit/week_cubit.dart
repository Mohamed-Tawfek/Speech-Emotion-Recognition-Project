import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_emotion_recognition_project/core/constants/api_constants.dart';
import 'package:speech_emotion_recognition_project/core/helpers/dio_helper.dart';
import 'package:speech_emotion_recognition_project/features/history/models/weekly_model.dart';

import '../../../../core/helpers/cash_helper.dart';
import '../../../share/model/followed_model.dart';
import '../../models/bar_chart_data.dart';
import '../../widgets/cong_dialog.dart';

part 'week_state.dart';

class WeekCubit extends Cubit<WeekState> {
  WeekCubit({required this.forDisplaySharing, this.model})
      : super(WeekInitial());
  static WeekCubit get(context) => BlocProvider.of(context, listen: false);
  bool forDisplaySharing;
  FollowedModel? model;
  List<BarChartData> chartData = [];
  WeeklyModel? weeklyModel;

  getWeeklyData()  {
    //  emit(GetWeeklyBarDataLoadingState());
    String userID =
        forDisplaySharing ? model!.userID : CashHelper.getData(key: 'userID');
    String token =
        forDisplaySharing ? model!.token : CashHelper.getData(key: 'token');

     DioHelper.get(
        url: '${ApiConstants.weeklyHistoryEndPoint}$userID',
        headers: {'token': token}).then((value) {
      weeklyModel = WeeklyModel.fromJson(value.data);
   //    weeklyModel = WeeklyModel.fromJson({
   //      'Month': {
   //        'Week 1': {
   //          'angry': Random().nextInt(10),
   //          'happy': Random().nextInt(10),
   //          'surprised': Random().nextInt(10),
   //          'neutral': Random().nextInt(10),
   //          'calm': Random().nextInt(10),
   //          'sad': Random().nextInt(10),
   //          'disgust': Random().nextInt(10),
   //          'fear': Random().nextInt(10),
   //
   //        },
   //        'Week 2': {
   //          'angry': Random().nextInt(10),
   //          'happy': Random().nextInt(10),
   //          'surprised': Random().nextInt(10),
   //          'neutral': Random().nextInt(10),
   //          'calm': Random().nextInt(10),
   //          'sad': Random().nextInt(10),
   //          'disgust': Random().nextInt(10),
   //          'fear': Random().nextInt(10),
   //        },
   //        'Week 3': {
   //          'angry': Random().nextInt(10),
   //          'happy': Random().nextInt(10),
   //          'surprised': Random().nextInt(10),
   //          'neutral': Random().nextInt(10),
   //          'calm': Random().nextInt(10),
   //          'sad': Random().nextInt(10),
   //          'disgust': Random().nextInt(10),
   //          'fear': Random().nextInt(10),
   //
   //        },
   //        'Week 4': {
   //          'angry': Random().nextInt(10),
   //          'happy': Random().nextInt(10),
   //          'surprised': Random().nextInt(10),
   //          'neutral': Random().nextInt(10),
   //          'calm': Random().nextInt(10),
   //          'sad': Random().nextInt(10),
   //          'disgust': Random().nextInt(10),
   //          'fear': Random().nextInt(10),
   //
   //        },
   //      }
   //    });
      chartData.add(BarChartData(
        'First',
        weeklyModel!.first.happy,
        weeklyModel!.first.angry,
        weeklyModel!.first.surprised,
        weeklyModel!.first.fear,
        weeklyModel!.first.sad,
        weeklyModel!.first.calm,
        weeklyModel!.first.natural,
        weeklyModel!.first.disgusted,
      ));
      chartData.add(BarChartData(
        'Second',
        weeklyModel!.second.happy,
        weeklyModel!.second.angry,
        weeklyModel!.second.surprised,
        weeklyModel!.second.fear,
        weeklyModel!.second.sad,
        weeklyModel!.second.calm,
        weeklyModel!.second.natural,
        weeklyModel!.second.disgusted,
      ));
      chartData.add(BarChartData(
        'Third',
        weeklyModel!.third.happy,
        weeklyModel!.third.angry,
        weeklyModel!.third.surprised,
        weeklyModel!.third.fear,
        weeklyModel!.third.sad,
        weeklyModel!.third.calm,
        weeklyModel!.third.natural,
        weeklyModel!.third.disgusted,
      ));
      chartData.add(BarChartData(
        'Fourth',
        weeklyModel!.fourth.happy,
        weeklyModel!.fourth.angry,
        weeklyModel!.fourth.surprised,
        weeklyModel!.fourth.fear,
        weeklyModel!.fourth.sad,
        weeklyModel!.fourth.calm,
        weeklyModel!.fourth.natural,
        weeklyModel!.fourth.disgusted,
      ));

      emit(GetWeeklyBarDataSuccessState());
    }).catchError((e) {
      debugPrint('=' * 20);
      debugPrint(e.toString());
      debugPrint('=' * 20);
      emit(GetWeeklyBarDataErrorState());
    });
//-----------------------------------------

  }




  void showCongMessage(BuildContext context) {
    showCongDialog(context);
  }
}
