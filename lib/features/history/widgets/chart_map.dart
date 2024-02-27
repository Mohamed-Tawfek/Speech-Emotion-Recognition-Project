import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';

import '../../../modes_controller/modes_cubit.dart';
import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';

class BuildChartMap extends StatelessWidget {
  const BuildChartMap({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.deviceWidth,
      child:   Center(
        child: Wrap(
          children: [
            MapItem(text: 'Happy'.tr(), color: Colors.amber),

            const SizedBox(
              width: 10,
              height: 20,
            ),
            MapItem(text: 'Angry'.tr(), color: Colors.red),

            const SizedBox(
              width: 10,
              height: 20,
            ),
            MapItem(text: 'Surprised'.tr(), color: Colors.blue),
            const SizedBox(
              width: 10,
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class MapItem extends StatelessWidget {
  const MapItem({super.key, required this.color, required this.text});
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    bool appMode = AppModeCubit.get(context).isDark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: color,
              height: 20,
              width: 20,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: TextStyle(
                  color:
                      appMode ? DarkColors.textColor : LightColors.textColor),
            ),
          ],
        ),
      ],
    );
  }
}
