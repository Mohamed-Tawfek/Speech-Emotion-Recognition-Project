 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/features/history/screens/history_screen.dart';
import 'package:speech_emotion_recognition_project/features/speech/widgets/switch_mode_widget.dart';
import 'package:speech_emotion_recognition_project/features/suggestion/screens/suggestion_screen.dart';

import '../../settings/screens/settings_screen.dart';
import 'drawer_components.dart';

class DrawerSpeechScreen extends StatelessWidget {
  const DrawerSpeechScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: drawerDecoration(),
      padding: EdgeInsetsDirectional.only(
        top: context.deviceHeight * 0.05,
      ),
      width: context.deviceWidth * 0.6,
      height: context.deviceHeight,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const BuildDrawerImage(
                url:
                    "https://media.licdn.com/dms/image/D4D03AQHXhxY0x4KXAQ/profile-displayphoto-shrink_800_800/0/1699261753374?e=1709769600&v=beta&t=4ZTxMXQx0vyxZAoGdB6GI8hCUMTr-_yC0gvT6kpO6Eo"),
            SizedBox(
              height: context.deviceHeight * 0.02,
            ),
            Center(
              child: Text(
                'Mohamed Tawfek',
                style: TextStyle(fontSize: 20.sp, color: Colors.black),
              ),
            ),
            SizedBox(
              height: context.deviceHeight * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dark',
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  width: context.deviceWidth * 0.04,
                ),
                SwitchModeWidget(),
              ],
            ),
            SizedBox(
              height: context.deviceHeight * 0.02,
            ),
            DrawerOption(
                name: 'History',
                icon: Icons.history,
                onTap: () {
                  Scaffold.of(context).closeDrawer();
                  context.push(const HistoryScreen());
                }),
            SizedBox(
              height: context.deviceHeight * 0.05,
            ),
            DrawerOption(icon: Icons.account_circle, name: 'Account', onTap: () {

              context.push(const SettingsScreen());
            }),
            SizedBox(
              height: context.deviceHeight * 0.05,
            ),
            DrawerOption(
                icon: Icons.lightbulb, name: 'Suggestion',
                onTap: () {
                  context.push(const SuggestionScreen());
                }),
            SizedBox(
              height: context.deviceHeight * 0.05,
            ),
            DrawerOption(icon: Icons.groups, name: 'About us', onTap: () {}),
            SizedBox(
              height: context.deviceHeight * 0.05,
            ),
            DrawerOption(icon: Icons.logout, name: 'Logout', onTap: () {}),
          ],
        ),
      ),
    );
  }

  BoxDecoration drawerDecoration() {
    return const BoxDecoration(
      // gradient: LinearGradient(
      //   begin: Alignment(-7.43, 0.0),
      //   end: Alignment(0.0, 0.0),
      //   colors: [
      //     Color.fromRGBO(229, 66, 108, 0),
      //     Color.fromRGBO(229, 66, 108, 0.75),
      //     Color.fromRGBO(156, 63, 125, 0.75),
      //   ],
      //   stops: [-0.0743, 0.4169, 0.9876],
      // ),
      color: Color(0xffCA4B7F)
    );
  }
}


