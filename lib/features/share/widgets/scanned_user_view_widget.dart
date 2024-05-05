import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';

import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';
import '../../../modes_controller/modes_cubit.dart';
import '../controller/followed_cubit.dart';

class ScannedUserViewWidget extends StatelessWidget {
  const ScannedUserViewWidget(
      {super.key,
      required this.image,
      required this.userName,
      required this.token,
      required this.userEmail,
      required this.cubit, required this.userID});
  final String image;
  final String userName;
  final String userID;
  final String userEmail;
  final String token;
  final FollowedCubit cubit;
  @override
  Widget build(BuildContext context) {
    bool appMode = AppModeCubit.get(context).isDark;

    return AlertDialog(
    backgroundColor: appMode
        ? DarkColors.scaffoldColor
        : LightColors.scaffoldColor,
      title: CircleAvatar(
        radius: 100,
        backgroundImage: NetworkImage(image),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            userName,
            style: TextStyle(
                fontSize: 20.sp,
                color: appMode ? DarkColors.textColor : LightColors.textColor),
          ),
          Text(
            userEmail,
            style: TextStyle(
                fontSize: 15.sp,
                color: appMode
                    ? DarkColors.subtitleColor
                    : LightColors.subtitleColor),
          ),
        ],
      ),
      actions: [
        MaterialButton(
          color: appMode ? DarkColors.primary : LightColors.primary,
          onPressed: () {
            cubit.addFollowed(
                context: context,
                token: token,
                userEmail: userEmail,
                userImage: image,
              userID: userID,

                userName: userName);
            context.pop;
          },
          child: Text(
            'ADD',
            style: TextStyle(
                color: appMode
                    ? DarkColors.scaffoldColor
                    : LightColors.scaffoldColor,
                fontSize: 12.sp),
          ),
        ),
        MaterialButton(
          onPressed: () {

            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: TextStyle(fontSize: 12.sp),
          ),
        ),
      ],
    );
  }
}
