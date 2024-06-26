import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/core/constants/light_theme_colors.dart';

class DrawerOption extends StatelessWidget {
  const DrawerOption(
      {super.key,
      required this.icon,
      required this.onTap,
      required this.name,
      required this.color});
  final String name;
  final Function()? onTap;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
          horizontal: context.deviceWidth * 0.05),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: color,
              size: 18.sp,
            ),
            SizedBox(
              width: context.deviceWidth * 0.05,
            ),
            Text(
              name,
              style: TextStyle(
                  fontSize: 15.sp, color: color),
            )
          ],
        ),
      ),
    );
  }
}

class BuildDrawerImage extends StatelessWidget {
  const BuildDrawerImage(
      {super.key, required this.url, this.radius
        ,this.color = Colors.white});
  final String url;
  final color;
final double?radius;
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsetsDirectional.all(2),
      decoration: const BoxDecoration(shape: BoxShape.circle, color: LightColors.primary),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: CircleAvatar(
        backgroundImage: NetworkImage(
          url,
        ),
        radius:radius?? context.deviceWidth * 0.12,
      ),
    );

  }
}



class NotFoundImageUser extends StatelessWidget {
  const NotFoundImageUser({super.key, this.radius,this.color = Colors.white});
  final double?radius;
  final color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(2),
      decoration: const BoxDecoration(shape: BoxShape.circle, color: LightColors.primary),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: CircleAvatar(
        backgroundImage: const AssetImage(
          'assets/icons/user.png',
        ),
        radius:radius?? context.deviceWidth * 0.12,
      ),
    );
  }
}

