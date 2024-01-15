 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/dark_theme_colors.dart';
import '../core/constants/light_theme_colors.dart';


ThemeData getDarkTheme() {
  return ThemeData(
      appBarTheme: AppBarTheme(
          color: DarkColors.appBar,
          surfaceTintColor: DarkColors.scaffoldColor ,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: DarkColors.scaffoldColor,
              statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
          ),
          centerTitle: true,
          titleTextStyle: TextStyle(
              color: DarkColors.textColor,
            fontSize: 20.sp
          ),
          iconTheme: const IconThemeData(
              color: DarkColors.appBarItems
          )
      ),
      inputDecorationTheme: InputDecorationTheme(
          filled: true,

          hintStyle: TextStyle(color: DarkColors.hintColor)  ,
          prefixIconColor: DarkColors.suffixAndPrefixColor,
          suffixIconColor:  DarkColors.suffixAndPrefixColor,
          fillColor: DarkColors.textFieldColor,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:   BorderSide(
                  color: DarkColors.textFieldFocusedBorderColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                  color: DarkColors.textFieldEnabledBorderColor)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                  color: DarkColors.textFieldErrorBorderColor)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(),
              borderRadius: BorderRadius.circular(30))),
      scaffoldBackgroundColor: DarkColors.scaffoldColor);
}
