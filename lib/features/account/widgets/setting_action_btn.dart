import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';

import '../../../Languages_and_modes_controller/languages_and_mode_scubit_cubit.dart';
import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';

class SettingActionBtn extends StatelessWidget {
  const SettingActionBtn(
      {super.key,
        required this.icon,
        required this.onTap,
        required this.text,
        this.color });
  final IconData icon;
  final String text;
  final Function()? onTap;
  final  Color? color;
  @override
  Widget build(BuildContext context) {
    bool appMode=LanguagesAndModesCubit.get(context).isDark;
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: appMode?DarkColors.buttonNavColor: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
        width: context.deviceWidth,
        padding: EdgeInsetsDirectional.symmetric(
            horizontal: context.deviceWidth * 0.04,
            vertical: context.deviceHeight * 0.02),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30.sp,
              color:color ?? (appMode?DarkColors.textColor: LightColors.textColor),
            ),
            SizedBox(
              width: context.deviceWidth * 0.05,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 18.sp, color: appMode?DarkColors.textColor: LightColors.textColor,fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
