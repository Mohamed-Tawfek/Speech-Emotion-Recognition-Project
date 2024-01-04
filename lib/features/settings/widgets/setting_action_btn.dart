import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';

class SettingActionBtn extends StatelessWidget {
  const SettingActionBtn(
      {super.key,
        required this.icon,
        required this.onTap,
        required this.text,
        this.color = Colors.black});
  final IconData icon;
  final String text;
  final Function()? onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        width: context.deviceWidth,
        padding: EdgeInsetsDirectional.symmetric(
            horizontal: context.deviceWidth * 0.04,
            vertical: context.deviceHeight * 0.02),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30.sp,
              color: color,
            ),
            SizedBox(
              width: context.deviceWidth * 0.05,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
