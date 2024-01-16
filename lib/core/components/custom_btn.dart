import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';

import '../../Languages_and_modes_controller/mode_scubit_cubit.dart';
import '../constants/dark_theme_colors.dart';
import '../constants/light_theme_colors.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn(
      {super.key,
        required this.hasBackground,
        required this.onPressed,
        this.color,
        this.textColor,
        required this.textChild});
  final void Function()? onPressed;
 final Color? color;
  final Color? textColor;
  final bool hasBackground;
  final String textChild;
  @override
  Widget build(BuildContext context) {
    bool appMode=AppModeCubit.get(context).isDark;
    return Container(
      height: context.deviceHeight * 0.08,
      width: context.deviceWidth * 0.4,
      decoration: BoxDecoration(
          color: hasBackground ?color?? const Color(0xffCA4B7F) : null,
          borderRadius: BorderRadius.circular(30)),
      child: MaterialButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: onPressed,
        child: Text(
          textChild,
          style: TextStyle(
              color:hasBackground? (appMode?DarkColors.scaffoldColor: LightColors.scaffoldColor):appMode?DarkColors.onBoardingBodyColor: LightColors.onBoardingBodyColor,
              fontSize: 18.sp),
        ),
      ),
    );
  }
}
