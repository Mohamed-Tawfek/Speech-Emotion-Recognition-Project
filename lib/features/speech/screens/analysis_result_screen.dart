import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/core/constants/dark_theme_colors.dart';
import 'package:speech_emotion_recognition_project/core/constants/light_theme_colors.dart';

import '../../../modes_controller/modes_cubit.dart';
import '../model/emotion_model.dart';

class AnalysisResultScreen extends StatelessWidget {
  const AnalysisResultScreen({super.key, required this.emotion});
  final EmotionModel emotion;
  @override
  Widget build(BuildContext context) {
    bool appMode = AppModeCubit.get(context).isDark;
    emotion.messages.shuffle();
    return Scaffold(
      appBar: AppBar(
        leading: const Text(''),
        //backgroundColor: const Color(0xffCA4B7F),
        title: const Text(
          'Result',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(top: context.deviceHeight * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Lottie.asset(emotion.lottiePath,
                  height: context.deviceHeight * 0.4,
                  width: context.deviceWidth * 0.8,
                  fit: BoxFit.cover),
            ),
            Center(
              child: AnimatedTextKit(
                isRepeatingAnimation: false,
                animatedTexts: [
                  TypewriterAnimatedText(emotion.name,
                      cursor: '',
                      textStyle: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                          color: appMode
                              ? DarkColors.primary
                              : LightColors.primary),
                      speed: Duration(milliseconds: 200)),
                ],
              ),
            ),
            SizedBox(
              height: context.deviceHeight * 0.06,
            ),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: context.deviceWidth * 0.03),
              child: AnimatedTextKit(
                isRepeatingAnimation: false,
                animatedTexts: [
                  TypewriterAnimatedText('Status improvement messages:',
                      textStyle: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: appMode
                              ? DarkColors.textColor
                              : LightColors.textColor),
                      cursor: '',
                      speed: Duration(milliseconds: 50)),
                ],
              ),
            ),
            SizedBox(
              height: context.deviceHeight * 0.015,
            ),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: context.deviceWidth * 0.07),
              child: AnimatedTextKit(
                isRepeatingAnimation: false,
                animatedTexts: [

                  TypewriterAnimatedText(emotion.messages.first,
                      cursor: '',
                      textStyle: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                          color: appMode
                              ? DarkColors.textColor
                              : LightColors.textColor),
                      speed: const Duration(milliseconds: 50)),


                ],
              ),
            ),
            SizedBox(
              height: context.deviceHeight * 0.04,
            ),
            Spacer(),
            Container(
              margin: EdgeInsetsDirectional.only(
                bottom: context.deviceHeight * 0.03,
                start: context.deviceWidth * 0.1,
                end: context.deviceWidth * 0.1,
              ),
              width: context.deviceWidth,
              child: MaterialButton(
                onPressed: () {
                  context.pop();
                },
                color: appMode ? DarkColors.primary : LightColors.primary,
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                    vertical: context.deviceHeight * 0.01,
                  ),
                  child: Text(
                    'Done',
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: appMode
                            ? DarkColors.scaffoldColor
                            : LightColors.scaffoldColor),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
