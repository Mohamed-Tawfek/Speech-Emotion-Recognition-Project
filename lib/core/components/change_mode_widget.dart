import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/core/constants/dark_theme_colors.dart';
import 'package:speech_emotion_recognition_project/core/constants/light_theme_colors.dart';

import '../../modes_controller/modes_cubit.dart';
import 'dialogs.dart';

class ChangeModeWidget extends StatelessWidget {
  const ChangeModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool appMode = AppModeCubit.get(context).isDark;

    return IconButton(
        onPressed: () {
         AppModeCubit.get(context).changeAppMode();


        },
        icon: Icon(appMode ? Icons.sunny : Icons.dark_mode));
  }
}
