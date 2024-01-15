import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/features/onboarding/screens/onboarding_screen.dart';
import 'package:speech_emotion_recognition_project/themes/dark_theme.dart';
import 'package:speech_emotion_recognition_project/themes/light_theme.dart';

import 'Languages_and_modes_controller/languages_and_mode_scubit_cubit.dart';
import 'features/setup_settings/screens/setup_settings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    context.deleteSaveLocale();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LanguagesAndModesCubit(),


        ),

      ],
      child: BlocBuilder<LanguagesAndModesCubit, LanguagesAndModeScubitState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitUp,
              ]);

              final appMode = LanguagesAndModesCubit
                  .get(context)
                  .isDark;
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                title: 'SER',
                theme: getLightTheme(),
                darkTheme: getDarkTheme(),
                themeMode: appMode ? ThemeMode.dark : ThemeMode.light,
                home: child,
              );
            },
            //  child: const HistoryScreen(),
            child: BlocBuilder<LanguagesAndModesCubit, LanguagesAndModeScubitState>(
              builder: (context, state) {
                return OnBoardingScreen();
              },
            ),
            // child: OnBoardingScreen(),
          );
        },
      ),
    );
  }
}
