import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MapItem(text: 'Natural', color: Color(0xffCFD8DC)),
                SizedBox(
                  height: context.deviceHeight * 0.015,
                ),
                MapItem(text: 'Calm', color: Color(0xff00BEFF)),

              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MapItem(text: 'Happy', color: Color(0xffFFEB00)),
                SizedBox(
                  height: context.deviceHeight * 0.015,
                ),
                MapItem(text: 'Sad', color: Color(0xff0057AE)),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MapItem(text: 'Angry', color: Color(0xffFF2414)),
                SizedBox(
                  height: context.deviceHeight * 0.015,
                ),
                MapItem(text: 'Fear', color: Color(0xffB7043C)),

              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MapItem(text: 'Disgust', color: Color(0xffA1E533)),
                SizedBox(
                  height: context.deviceHeight * 0.015,
                ),
                MapItem(text: 'Surprised', color: Color(0xffFF6900)),
              ],
            )
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
