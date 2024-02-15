import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/helpers/cash_helper.dart';
import 'package:speech_emotion_recognition_project/features/authentication/screens/login_screen.dart';
import 'package:speech_emotion_recognition_project/features/onboarding/screens/onboarding_screen.dart';
import 'package:speech_emotion_recognition_project/features/speech/screens/speech_screen.dart';
import 'package:speech_emotion_recognition_project/themes/dark_theme.dart';
import 'package:speech_emotion_recognition_project/themes/light_theme.dart';

import '../../../modes_controller/modes_cubit.dart';
import 'features/offline_screen.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {


    bool onBoardingShown = CashHelper.getData(key: 'OnBoardingShown') ?? false;
    bool isLogged = CashHelper.getData(key: 'token') != null;

    return BlocProvider(
      create: (context) => AppModeCubit()..init(),
      child: BlocBuilder<AppModeCubit, AppModeState>(
        builder: (context, state) {
          return OfflineBuilder(
            connectivityBuilder: (
              BuildContext context,
              ConnectivityResult connectivity,
              Widget child,
            ) {
              final bool connected = connectivity != ConnectivityResult.none;
              if (connected) {
                return ScreenUtilInit(
                  designSize: const Size(360, 690),
                  minTextAdapt: true,
                  splitScreenMode: true,
                  builder: (_, child) {
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.portraitUp,
                    ]);

                    final appMode = AppModeCubit.get(context).isDark;
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
                  //child:   OfflineScreen(),
                  child: onBoardingShown
                      ? isLogged
                          ? const SpeechScreen()
                          : LoginScreen()
                      : OnBoardingScreen(),
                );
              } else {
                return ScreenUtilInit(
                    designSize: const Size(360, 690),
                    minTextAdapt: true,
                    splitScreenMode: true,
                    builder: (_, child) {
                      SystemChrome.setPreferredOrientations([
                        DeviceOrientation.portraitUp,
                      ]);

                       return MaterialApp(
                        home: child,
                         debugShowCheckedModeBanner: false ,
                      );
                    },
                    child: const OfflineScreen());
              }
            },
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
