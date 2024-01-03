import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_emotion_recognition_project/features/history/screens/daily_analysis_screen.dart';
import 'package:speech_emotion_recognition_project/features/history/screens/monthly_analysis_screen.dart';
import 'package:speech_emotion_recognition_project/features/history/screens/weekly_analysis_screen.dart';

import 'history_state.dart';


class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(HistoryInitial());
  static HistoryCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> screens = [
    DailyAnalysisScreen(),
    WeeklyAnalysisScreen(),
    MonthlyAnalysisScreen()
  ];

  changeScreen(int index) {
    currentIndex = index;
    emit(ChangeScreenState());
  }


}
