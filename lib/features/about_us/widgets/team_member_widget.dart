import 'package:flutter/material.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';

import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';
import '../../../modes_controller/modes_cubit.dart';

class TeamMemberWidget extends StatelessWidget {
  const TeamMemberWidget(
      {super.key,
        required this.name,
        required this.imagePath,
        required this.job});

  final String imagePath;
  final String name;
  final String job;
  @override
  Widget build(BuildContext context) {
    bool appMode = AppModeCubit.get(context).isDark;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsetsDirectional.all(5),
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Color(0xffCA4B7F)),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: CircleAvatar(
            backgroundImage: AssetImage(
              imagePath,
            ),
            radius: context.deviceWidth * 0.10,
          ),
        ),
        SizedBox(
          height: context.deviceHeight * 0.010,
        ),
        Text(
          name,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: appMode ? DarkColors.textColor : LightColors.textColor),
        ),
        Text(
          job,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: appMode
                  ? DarkColors.subtitleColor
                  : LightColors.subtitleColor),
        ),
      ],
    );
  }
}
