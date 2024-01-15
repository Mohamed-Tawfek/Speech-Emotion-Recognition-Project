import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/Languages_and_modes_controller/languages_and_mode_scubit_cubit.dart';

import '../core/constants/light_theme_colors.dart';

ThemeData getLightTheme() {
  return ThemeData(
    appBarTheme: AppBarTheme(
      color: LightColors.appBar,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: LightColors.scaffoldColor,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
        centerTitle: true,
        surfaceTintColor: LightColors.scaffoldColor ,

        iconTheme: IconThemeData(
        color: LightColors.appBarItems
      ),
      titleTextStyle: TextStyle(
        color: LightColors.textColor,
        fontSize: 20.sp
      )
    ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: LightColors.hintColor)  ,
          filled: true,

          prefixIconColor: LightColors.suffixAndPrefixColor,
          suffixIconColor: LightColors.suffixAndPrefixColor,
          fillColor: LightColors.textFieldColor,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                  color: LightColors.textFieldFocusedBorderColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                  color: LightColors.textFieldEnabledBorderColor)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                  color: LightColors.textFieldErrorBorderColor)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(),
              borderRadius: BorderRadius.circular(30))),
      scaffoldBackgroundColor: LightColors.scaffoldColor);
}
