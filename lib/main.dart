import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:speech_emotion_recognition_project/core/helpers/cash_helper.dart';
import 'package:speech_emotion_recognition_project/core/helpers/dio_helper.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  DioHelper.init();
  CashHelper.init();
  refreshServer();
  runApp(_app());
}

EasyLocalization _app() {
  return EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      path: 'assets/langs',
      fallbackLocale: const Locale('en'),
      child: const MyApp());
}

Future<void> refreshServer() async{
  await DioHelper.get(url: 'https://speech-sapm.onrender.com');
    Future.delayed(const Duration(minutes: 10)).then((value) {
    refreshServer();
  });
}
