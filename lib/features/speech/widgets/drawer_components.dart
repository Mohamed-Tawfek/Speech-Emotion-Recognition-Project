import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';

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
      {super.key, required this.url, this.radius,this.color = Colors.white});
  final String url;
  final color;
final double?radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(2),
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: CircleAvatar(
        backgroundImage: NetworkImage(
          url,
        ),
        radius:radius?? context.deviceWidth * 0.12,
      ),
    );
    // return Container(
    //   decoration: const BoxDecoration(shape: BoxShape.circle),
    //   clipBehavior: Clip.antiAliasWithSaveLayer,
    //   child: Center(
    //     child: CachedNetworkImage(
    //       height: context.deviceHeight * 0.15,
    //       width: context.deviceWidth * 0.3,
    //       fit: BoxFit.cover,
    //       imageUrl: url,
    //       placeholder: (context, url) =>
    //           const Center(child: CircularProgressIndicator()),
    //       errorWidget: (context, url, error) => const Icon(Icons.error),
    //     ),
    //   ),
    // );
  }
}
