import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/constants/dark_theme_colors.dart';
import 'package:speech_emotion_recognition_project/core/constants/light_theme_colors.dart';
import 'package:speech_emotion_recognition_project/features/share/screens/code_screen.dart';
import 'package:speech_emotion_recognition_project/features/share/screens/follow_screen.dart';

import '../../../modes_controller/modes_cubit.dart';

class ShareMainScreen extends StatelessWidget {
  const ShareMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool appMode = AppModeCubit.get(context).isDark;

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title:   Text('Sharing',
          style: TextStyle(
            color: appMode ? DarkColors.textColor : LightColors.textColor,
            fontSize: 15.sp
          ),
          ),
          bottom: TabBar(
            indicatorColor: appMode ? DarkColors.primary : LightColors.primary,
            labelColor: appMode ? DarkColors.primary : LightColors.primary,
            tabs: <Widget>[
              Tab(
                text: 'Followed',
              ),
              Tab(
                text: 'My Code',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[FollowScreen(), CodeScreen()],
        ),
      ),
    );
  }
}
