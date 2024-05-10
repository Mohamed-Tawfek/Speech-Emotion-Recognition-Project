 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';

import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';
import '../../../modes_controller/modes_cubit.dart';

class  SupportPalastineWidget extends StatelessWidget {
  const SupportPalastineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool appMode = AppModeCubit.get(context).isDark;

    return    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Lottie.asset(
          'assets/lotties/palestine.json',
          height: 130,
          width: 130,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: context.deviceHeight * 0.01,
        ),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(
              horizontal: context.deviceHeight * 0.04),
          child: Text(
            'This application supports the Palestinian cause' ,
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w900,
                color: appMode
                    ? DarkColors.textColor
                    : LightColors.textColor),
          ),
        ),
      ],
    );
  }
}
