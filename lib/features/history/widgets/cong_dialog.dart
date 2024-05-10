import 'package:animated_text_kit/animated_text_kit.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';

import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';
import '../../../modes_controller/modes_cubit.dart';

showCongDialog(BuildContext context) {
  bool appMode = AppModeCubit.get(context).isDark;

  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            backgroundColor:
                appMode ? DarkColors.scaffoldColor : LightColors.scaffoldColor,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsetsDirectional.all(25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: appMode ? DarkColors.primary : LightColors.primary,
                  ),
                  child: Image.asset(
                    'assets/icons/cong.png',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: context.deviceHeight * 0.04,
                ),
                AnimatedTextKit(
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Congratulations, based on your statistics, your highest emotion last week was angry, and now your highest emotion is happy, and we hope that you will be happy forever'
                           ,
                      textStyle: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: appMode
                              ? DarkColors.textColor
                              : LightColors.textColor),
                      speed: const Duration(
                        milliseconds: 50,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.deviceHeight * 0.04,
                ),
                MaterialButton(
                  onPressed: () {
                    context.pop();
                  },
                  color: appMode ? DarkColors.primary : LightColors.primary,
                  child: Text(
                    'Done',
                    style: TextStyle(
                        color: appMode
                            ? DarkColors.scaffoldColor
                            : LightColors.scaffoldColor),
                  ),
                )
              ],
            ),
          ));
}
