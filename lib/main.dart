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
  runApp(_app());
}

EasyLocalization _app() {
  return EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      path: 'assets/langs',
      fallbackLocale: const Locale('en'),
      child: const MyApp());
}
