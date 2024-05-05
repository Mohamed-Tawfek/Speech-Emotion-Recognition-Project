import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:speech_emotion_recognition_project/core/constants/api_constants.dart';
import 'package:speech_emotion_recognition_project/core/helpers/cash_helper.dart';
import 'package:speech_emotion_recognition_project/core/helpers/dio_helper.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  DioHelper.init();
  await  CashHelper.init();
// CashHelper.setData(key: 'token', value: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNvbWlhc2FhZDAxMkBnbWFpbC5jb20iLCJ1c2VySWQiOiI2NjE3YzRlZjY0Y2UwNjRhMzQ2YTUxZjUiLCJmaXJzdG5hbWUiOiJzYXJhIiwibGFzdG5hbWUiOiJzYWFhZGQiLCJmdWxsbmFtZSI6InNhcmEgc2FhYWRkIiwiaWF0IjoxNzEyODY2NjcxfQ.2QcdOXk2jK_VH55xFr9WXl9M-rqF1RPQVnrYmbae0wc');
// CashHelper.setData(key: 'userID', value: '660d9fbfef18c3b28030f998');
  refreshServer();
  runApp(const MyApp());
}

EasyLocalization _app() {
  return EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      path: 'assets/langs',
      fallbackLocale: const Locale('en'),
      child: const MyApp());
}

Future<void> refreshServer() async{
  await DioHelper.get(url: ApiConstants.baseUrl);
    Future.delayed(const Duration(minutes: 10)).then((value) {
    refreshServer();
  });
}
