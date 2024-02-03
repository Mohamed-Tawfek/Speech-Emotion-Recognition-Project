import 'package:fluttertoast/fluttertoast.dart';
import 'package:speech_emotion_recognition_project/core/constants/dark_theme_colors.dart';
import 'package:speech_emotion_recognition_project/core/constants/light_theme_colors.dart';

import '../../modes_controller/modes_cubit.dart';

void showToast(context, String message) {
  final appMode = AppModeCubit.get(context).isDark;

  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: appMode ? DarkColors.primary : LightColors.primary,
      textColor: appMode ? DarkColors.textColor : LightColors.textColor,
      fontSize: 16.0);


}
