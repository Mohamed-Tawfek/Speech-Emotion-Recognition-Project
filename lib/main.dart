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
  await  CashHelper.init();
 await CashHelper.setData(key: 'userName', value: 'Ali Mohamed');
  await CashHelper.setData(key: 'userImage', value: 'https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
  await  CashHelper.setData(key: 'userEmail', value: 'ali@gmail.com');
  await  CashHelper.setData(key: 'token', value: 'tokentokentoken');
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
