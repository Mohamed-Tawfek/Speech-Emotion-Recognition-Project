import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_emotion_recognition_project/features/history/screens/daily_analysis_screen.dart';
import 'package:speech_emotion_recognition_project/features/history/screens/monthly_analysis_screen.dart';
import 'package:speech_emotion_recognition_project/features/history/screens/weekly_analysis_screen.dart';
import 'package:speech_emotion_recognition_project/features/share/model/followed_model.dart';

import 'history_state.dart';


class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit({required this.forDisplaySharing,this.model}) : super(HistoryInitial()){
    screens = [
      DailyAnalysisScreen(forDisplaySharing:forDisplaySharing ,model:model ,),
      WeeklyAnalysisScreen(forDisplaySharing:forDisplaySharing ,model:model ,),
      MonthlyAnalysisScreen(forDisplaySharing:forDisplaySharing ,model:model ,)
    ];
  }
  static HistoryCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
bool forDisplaySharing;
FollowedModel? model;
  List<Widget> screens = [

  ];

  changeScreen(int index) {
    currentIndex = index;
    emit(ChangeScreenState());
  }


}
