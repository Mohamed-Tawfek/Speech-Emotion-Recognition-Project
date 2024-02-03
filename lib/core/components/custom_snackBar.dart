import 'package:flutter/material.dart';
import 'package:speech_emotion_recognition_project/core/constants/dark_theme_colors.dart';
import 'package:speech_emotion_recognition_project/core/constants/light_theme_colors.dart';

import '../../modes_controller/modes_cubit.dart';


void showCustomSnackBar(BuildContext context,String message){
  bool appMode=AppModeCubit.get(context).isDark;

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message,
    style:   TextStyle(
        color: appMode?DarkColors.textColor:LightColors.textColor
    ),
  ),
    backgroundColor:appMode?DarkColors.primary:LightColors.primary,
  ));

}