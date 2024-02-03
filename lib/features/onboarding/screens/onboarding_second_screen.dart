import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/core/constants/dark_theme_colors.dart';
import 'package:speech_emotion_recognition_project/core/constants/light_theme_colors.dart';

import '../../../modes_controller/modes_cubit.dart';

class OnBoardingSecondScreen extends StatelessWidget {
  const OnBoardingSecondScreen({super.key});

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
              'assets/images/Voice_assistant-pana-removebg-preview 1.png',
              height: context.deviceHeight * 0.4,
              width: context.deviceWidth * 0.7,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: context.deviceHeight * 0.03,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.deviceWidth * 0.05,
                  vertical: context.deviceHeight * 0.01),
              child: Text(
                'The voice often reflects underlying emotion through tone and pitch.',
                style: TextStyle(
                  fontSize: 15.sp,
                  color: appMode ? DarkColors.textColor : LightColors.textColor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.deviceWidth * 0.05,
                  vertical: context.deviceHeight * 0.005),
              child: Text(
                'Through SER, we can determine the feeling from speech, it shows the emotions that ypur voice holds.',
                style: TextStyle(
                  fontSize: 15.sp,
                  color: appMode ? DarkColors.textColor : LightColors.textColor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.deviceWidth * 0.05,
                  vertical: context.deviceHeight * 0.005),
              child: Text(
                'It shows the result in the form of emojis that describe your feelings.',
                style: TextStyle(
                  fontSize: 15.sp,
                  color: appMode ? DarkColors.primary : LightColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
