import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/core/constants/dark_theme_colors.dart';
import 'package:speech_emotion_recognition_project/core/constants/light_theme_colors.dart';

import '../core/components/change_mode_widget.dart';
import '../modes_controller/modes_cubit.dart';

class OfflineScreen extends StatelessWidget {
  const OfflineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appMode = AppModeCubit.get(context).isDark;

    return Scaffold(
      backgroundColor:appMode?DarkColors.scaffoldColor:LightColors.scaffoldColor,

      body: Container(
        width: context.deviceWidth,
        height: context.deviceHeight,
        padding: EdgeInsetsDirectional.only(
         bottom: context.deviceHeight*0.2
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/lotties/connection_error.json',
          //  width: context.deviceWidth*0.8
            ),
            Text('No internet connection'.tr(),
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: appMode?DarkColors.textColor:LightColors.textColor
            ),
            )
          ],
        ),
      ),
    );
  }
}