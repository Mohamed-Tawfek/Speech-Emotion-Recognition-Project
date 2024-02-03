import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/core/constants/dark_theme_colors.dart';
import 'package:speech_emotion_recognition_project/core/constants/light_theme_colors.dart';

import '../../../modes_controller/modes_cubit.dart';

class OnBoardingFirstScreen extends StatelessWidget {
  const OnBoardingFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool appMode = AppModeCubit.get(context).isDark;

    return Scaffold(
      body: SizedBox(
        width: context.deviceWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Welcome.png',
              height: context.deviceHeight * 0.4,
              width: context.deviceWidth * 0.7,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: context.deviceHeight * 0.03,
            ),
            Text('Welcome to SER',
                style: TextStyle(
                    color: appMode ? DarkColors.primary : LightColors.primary,
                    fontSize: 30.sp)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.deviceWidth * 0.05,
                  vertical: context.deviceHeight * 0.03),
              child: Text(
                'SER is the abbreviation of Speech Emotion Recognition,which is the act of attempting to recognize human emotion and affective states from speech',
                style: TextStyle(
                  fontSize: 15.sp,
                  color: appMode ? DarkColors.textColor : LightColors.textColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
