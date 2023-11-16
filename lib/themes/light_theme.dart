 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/constants/light_theme_colors.dart';

ThemeData getLightTheme() {
  return ThemeData(
      fontFamily: 'Poppins',
      primarySwatch: LightColors.primary,
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: LightColors.appBarIcon),
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor:LightColors.statusBar ,
         statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark),
          color:LightColors.appBar ,
          elevation: 0.0),
     inputDecorationTheme:const InputDecorationTheme(
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: LightColors.textField))
     ),
      scaffoldBackgroundColor: LightColors.scaffoldBackground,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: LightColors.btnNavSelectedItem));
}
