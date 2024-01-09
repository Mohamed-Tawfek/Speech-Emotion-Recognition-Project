import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/features/history/screens/history_screen.dart';
import 'package:speech_emotion_recognition_project/features/suggestion/screens/suggestion_screen.dart';

import '../../about_us/screens/about_us_screen.dart';
import '../../settings/screens/settings_screen.dart';
import 'drawer_components.dart';
import 'languages_ratios.dart';
import 'modes_radios.dart';

class DrawerSpeechScreen extends StatelessWidget {
  const DrawerSpeechScreen({
    super.key,
  });
  static Color drawerItemsColor = Colors.black;
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
            BuildDrawerImage(
              color: drawerItemsColor,
              url:
                  "https://firebasestorage.googleapis.com/v0/b/social-app-c6d04.appspot.com/o/%D9%A2%D9%A0%D9%A2%D9%A1%D9%A0%D9%A2%D9%A2%D9%A2_%D9%A1%D9%A4%D9%A2%D9%A1%D9%A4%D9%A8.jpg?alt=media&token=91863248-968c-4abe-934f-da04f3cce306",
            ),
            SizedBox(
              height: context.deviceHeight * 0.02,
            ),
            Center(
              child: Text(
                'Mohamed Tawfek',
                style: TextStyle(fontSize: 20.sp, color: drawerItemsColor),
              ),
            ),
            SizedBox(
              height: context.deviceHeight * 0.02,
            ),
            const SwitchModeWidget(),
            BuildDrawerDivider(drawerItemsColor: drawerItemsColor),
            const SwitchLanguageWidget(),
            BuildDrawerDivider(drawerItemsColor: drawerItemsColor),
            DrawerOption(
                color: drawerItemsColor,
                name: 'History',
                icon: Icons.history,
                onTap: () {
                  Scaffold.of(context).closeDrawer();
                  context.push(const HistoryScreen());
                }),
            BuildDrawerDivider(drawerItemsColor: drawerItemsColor),
            DrawerOption(
                color: drawerItemsColor,
                icon: Icons.account_circle,
                name: 'Account',
                onTap: () {
                  Scaffold.of(context).closeDrawer();

                  context.push(const SettingsScreen());
                }),
            BuildDrawerDivider(drawerItemsColor: drawerItemsColor),
            DrawerOption(
                color: drawerItemsColor,
                icon: Icons.lightbulb,
                name: 'Suggestion',
                onTap: () {
                  Scaffold.of(context).closeDrawer();

                  context.push(const SuggestionScreen());
                }),
            BuildDrawerDivider(drawerItemsColor: drawerItemsColor),
            DrawerOption(
                color: drawerItemsColor,
                icon: Icons.groups,
                name: 'About us',
                onTap: () {
                  Scaffold.of(context).closeDrawer();

                  context.push(const AboutUsScreen());
                }),
            BuildDrawerDivider(drawerItemsColor: drawerItemsColor),
            DrawerOption(
                color: drawerItemsColor,
                icon: Icons.logout,
                name: 'Logout',
                onTap: () {}),
            BuildDrawerDivider(drawerItemsColor: drawerItemsColor),
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
        color: Color(0xffCA4B7F));
  }
}

class BuildDrawerDivider extends StatelessWidget {
  const BuildDrawerDivider({
    super.key,
    required this.drawerItemsColor,
  });

  final Color drawerItemsColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.deviceHeight * 0.022,
        ),
        Padding(
          padding:
              EdgeInsetsDirectional.only(start: context.deviceWidth * 0.12),
          child: Container(
            height: 1,
            color: drawerItemsColor.withOpacity(0.4),
            width: double.infinity,
          ),
        ),
        SizedBox(
          height: context.deviceHeight * 0.022,
        ),
      ],
    );
  }
}
