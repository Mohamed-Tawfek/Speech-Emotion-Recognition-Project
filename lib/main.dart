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
 //  CashHelper.setData(key: 'token', value: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNvbWlhc2FhZDAxMkBnbWFpbC5jb20iLCJ1c2VySWQiOiI2NjE3YzRlZjY0Y2UwNjRhMzQ2YTUxZjUiLCJmaXJzdG5hbWUiOiJzYXJhIiwibGFzdG5hbWUiOiJzYWFhZGQiLCJmdWxsbmFtZSI6InNhcmEgc2FhYWRkIiwiaWF0IjoxNzEyODM0MTg1fQ.HtvYH8HpHLkET5F84iiEsojXFpcV83qmPiuoedw96Bo');
  // CashHelper.setData(key: 'userID', value:  '6647c775a9409216f84991a8');
 // CashHelper.setData(key: 'userID', value:  '6647d9ed52404f09829b9e6e');
 //  CashHelper.setData(key: 'userEmail', value: 'kokko@email.com');
 //  CashHelper.setData(key: 'userImage', value: 'https://images.pexels.com/photos/874158/pexels-photo-874158.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
 //  CashHelper.setData(key: 'userName', value: 'Amr Tawfek');

  refreshServer();
  runApp(const MyApp());
}



Future<void> refreshServer() async{
  await DioHelper.get(url: ApiConstants.baseUrl);
    Future.delayed(const Duration(minutes: 10)).then((value) {
    refreshServer();
  });
}
