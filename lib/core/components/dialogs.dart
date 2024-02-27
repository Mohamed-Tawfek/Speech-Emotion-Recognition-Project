import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';

import '../../modes_controller/modes_cubit.dart';
import '../constants/dark_theme_colors.dart';
import '../constants/light_theme_colors.dart';

Future showLoadingDialog(context) {
  bool appMode = AppModeCubit.get(context).isDark;

  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => AlertDialog(
            backgroundColor:
                appMode ? DarkColors.scaffoldColor : LightColors.scaffoldColor,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                  color: appMode ? DarkColors.primary : LightColors.primary,
                ),
                const SizedBox(height: 20),
                Text(
                  'Loading'.tr(),
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: appMode
                          ? DarkColors.textColor
                          : LightColors.textColor),
                )
              ],
            ),
          ));
}

Future showConfirmDialog(BuildContext context,  void Function()? yesOnPressed,String message) {
  bool appMode = AppModeCubit.get(context).isDark;

  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => AlertDialog(
            contentPadding: EdgeInsetsDirectional.all(10.0),
            titlePadding: EdgeInsetsDirectional.all(0.0),
            backgroundColor:
                appMode ? DarkColors.scaffoldColor : LightColors.scaffoldColor,
            content: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.warning,
                  size: 50,
                  color: appMode ? DarkColors.primary : LightColors.primary,

                ),
                SizedBox(
                  width: context.deviceWidth * 0.03,
                ),
                Text(message,
                  style: TextStyle(
                      color: appMode
                          ? DarkColors.textColor
                          : LightColors.textColor,
                      fontSize: 12.sp),

                )
              ],
            ),
            title: Container(
              color: appMode ? DarkColors.primary : LightColors.primary,
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: context.deviceWidth * 0.03),
              child: Row(
                children: [
                  Text(
                    'Confirm'.tr(),
                    style: TextStyle(
                      color: appMode
                          ? DarkColors.scaffoldColor
                          : LightColors.scaffoldColor,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      onPressed:  ()=>context.pop(),
                      icon: Icon(
                        Icons.clear,
                        color: appMode
                            ? DarkColors.scaffoldColor
                            : LightColors.scaffoldColor,
                      ))
                ],
              ),
            ),
            actions: [
              MaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onPressed: ()=>context.pop(),
                child: Text(
                  'No'.tr(),
                  style: TextStyle(
                      color: appMode
                          ? DarkColors.textColor
                          : LightColors.textColor,
                      fontSize: 12.sp),
                ),
              ),
              MaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                color: appMode ? DarkColors.primary : LightColors.primary,
                onPressed: yesOnPressed,
                child: Text(
                  'Yes'.tr(),
                  style: TextStyle(
                      color: appMode
                          ? DarkColors.scaffoldColor
                          : LightColors.scaffoldColor,
                      fontSize: 12.sp),
                ),
              ),
            ],
          ));
}
