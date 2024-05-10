 import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:speech_emotion_recognition_project/core/constants/api_constants.dart';
import 'package:speech_emotion_recognition_project/core/helpers/cash_helper.dart';
import 'package:speech_emotion_recognition_project/core/helpers/dio_helper.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   DioHelper.init();
  await  CashHelper.init();


  refreshServer();
  runApp(const MyApp());
}



Future<void> refreshServer() async{
  await DioHelper.get(url: ApiConstants.baseUrl);
    Future.delayed(const Duration(minutes: 10)).then((value) {
    refreshServer();
  });
}
