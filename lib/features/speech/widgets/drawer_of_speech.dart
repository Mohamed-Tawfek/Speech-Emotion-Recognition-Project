import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/features/authentication/screens/login_screen.dart';
import 'package:speech_emotion_recognition_project/features/history/screens/history_screen.dart';
import 'package:speech_emotion_recognition_project/features/suggestion/screens/suggestion_screen.dart';
import '../../../modes_controller/modes_cubit.dart';
import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';
import '../../about_us/screens/about_us_screen.dart';
import '../../account/screens/account_screen.dart';
import 'drawer_components.dart';
import 'modes_radios.dart';

class DrawerSpeechScreen extends StatelessWidget {
  const DrawerSpeechScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppModeCubit, AppModeState>(
      builder: (context, state) {
         bool appMode = AppModeCubit.get(context).isDark;

        Color drawerItemsColor =
            appMode ? DarkColors.textColor : LightColors.textColor;

        return Container(
          decoration: drawerDecoration(context),
          padding: EdgeInsetsDirectional.only(
            top: context.deviceHeight * 0.05,
          ),
          width: context.deviceWidth * 0.7,
          height: context.deviceHeight,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: context.deviceWidth * 0.05),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: (){
                     context.pop();
                      context.push(const AccountScreen());

                    },
                    child: Row(
                      children: [
                        BuildDrawerImage(
                          color: drawerItemsColor,
                          url:
                              "https://firebasestorage.googleapis.com/v0/b/social-app-c6d04.appspot.com/o/%D9%A2%D9%A0%D9%A2%D9%A1%D9%A0%D9%A2%D9%A2%D9%A2_%D9%A1%D9%A4%D9%A2%D9%A1%D9%A4%D9%A8.jpg?alt=media&token=91863248-968c-4abe-934f-da04f3cce306",
                        ),
                        SizedBox(
                          width: context.deviceWidth * 0.03,
                        ),
                        Column(
                          children: [
                            Text(
                              'Mohamed Tawfek',
                              style: TextStyle(
                                  fontSize: 12.sp, color: drawerItemsColor),
                            ),
                            Text(
                              'mohamed@gmail.com',
                              style: TextStyle(
                                  fontSize: 10.sp, color: drawerItemsColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: context.deviceHeight * 0.02,
                ),
                SwitchModeWidget(color: drawerItemsColor),
                // BuildDividerBetweenSwitches(
                //     color: drawerItemsColor.withOpacity(0.4)),
                // SwitchLanguageWidget(
                //   color: drawerItemsColor,
                // ),
                 BuildDrawerDivider(drawerItemsColor: drawerItemsColor),
                DrawerOption(
                    color: drawerItemsColor,
                    name: 'History'.tr(),
                    icon: Icons.history,
                    onTap: () {
                      Scaffold.of(context).closeDrawer();
                      context.push(const HistoryScreen());
                    }),
                BuildDrawerDivider(drawerItemsColor: drawerItemsColor),
                DrawerOption(
                    color: drawerItemsColor,
                    icon: Icons.account_circle_outlined,
                    name: 'Account'.tr(),
                    onTap: () {
                      Scaffold.of(context).closeDrawer();

                      context.push(const AccountScreen());
                    }),
                BuildDrawerDivider(drawerItemsColor: drawerItemsColor),
                DrawerOption(
                    color: drawerItemsColor,
                    icon: Icons.lightbulb_outline,
                    name: 'Suggestion'.tr(),
                    onTap: () {
                      Scaffold.of(context).closeDrawer();

                      context.push(const SuggestionScreen());
                    }),
                BuildDrawerDivider(drawerItemsColor: drawerItemsColor),
                DrawerOption(
                    color: drawerItemsColor,
                    icon: Icons.groups,
                    name: 'About us'.tr(),
                    onTap: () {
                      Scaffold.of(context).closeDrawer();

                      context.push(const AboutUsScreen());
                    }),
                BuildDrawerDivider(drawerItemsColor: drawerItemsColor),
                DrawerOption(
                    color: drawerItemsColor,
                    icon: Icons.logout,
                    name: 'Logout'.tr(),
                    onTap: () {
                      context.pushAndRemoveUntil(LoginScreen());
                    }),
                BuildDrawerDivider(drawerItemsColor: drawerItemsColor),
              ],
            ),
          ),
        );
      },
    );
  }

  BoxDecoration drawerDecoration(context) {
    bool appMode = AppModeCubit.get(context).isDark;

    return BoxDecoration(
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
        //color: Color(0xffCA4B7F)
        color: appMode ? DarkColors.drawerColor : LightColors.drawerColor,
        borderRadius: const BorderRadiusDirectional.only(
            topEnd: Radius.circular(30), bottomEnd: Radius.circular(30))
        //color: Color(0xff0e1621)

        );
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
            height: 0.5,
            color: drawerItemsColor.withOpacity(0.2),
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

class BuildDividerBetweenSwitches extends StatelessWidget {
  const BuildDividerBetweenSwitches({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: context.deviceWidth * 0.12),
      child: Container(
        height: 0.1,
        color: color,
        width: double.infinity,
      ),
    );
  }
}
