import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/features/suggestion/screens/suggestion_screen.dart';

import 'features/about_us/screens/about_us_screen.dart';
import 'features/speech/screens/speech_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SER',
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(color: Colors.white)),
          home: child,
        );
      },
      //  child: const HistoryScreen(),
      child: SpeechScreen(),
     // child: AboutUsScreen(),
    );
  }
}
