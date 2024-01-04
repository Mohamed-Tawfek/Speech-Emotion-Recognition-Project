import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';

class DrawerOption extends StatelessWidget {
  const DrawerOption(
      {super.key, required this.icon, required this.onTap, required this.name});
  final String name;
  final Function()? onTap;
  final IconData icon;
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
            Icon(icon),
            SizedBox(
              width: context.deviceWidth * 0.05,
            ),
            Text(
              name,
              style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}

class BuildDrawerImage extends StatelessWidget {
  const BuildDrawerImage({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          shape: BoxShape.circle),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: CachedNetworkImage(
        height: context.deviceHeight * 0.15,
        width: context.deviceWidth * 0.3,
        imageUrl: url,
        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
