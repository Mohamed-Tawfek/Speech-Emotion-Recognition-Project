import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';

import '../../../modes_controller/modes_cubit.dart';
import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';

class ThanksScreen extends StatelessWidget {
  const ThanksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool appMode=AppModeCubit.get(context).isDark;

    return Scaffold(
       appBar: AppBar(
       systemOverlayStyle: SystemUiOverlayStyle(
         statusBarColor:appMode?DarkColors.scaffoldColor: LightColors.scaffoldColor
       ),
       ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          top: context.deviceHeight * 0.05,
        ),
        child: Column(
          children: [
            Lottie.asset(
              'assets/lotties/thanks.json',
              fit: BoxFit.cover,
            ),
            const Spacer(),
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
                color: appMode?DarkColors.primary:LightColors.primary,
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                    vertical: context.deviceHeight * 0.01,
                  ),
                  child: Text(
                    'Done'.tr(),
                    style: TextStyle(fontSize: 20.sp,
                        color: appMode?DarkColors.scaffoldColor: LightColors.scaffoldColor),
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
