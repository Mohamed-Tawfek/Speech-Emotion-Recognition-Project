import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
 import 'package:speech_emotion_recognition_project/core/components/custom_btn.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/features/suggestion/screens/thanks_screen.dart';

import '../../../modes_controller/modes_cubit.dart';
import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';

class SuggestionScreen extends StatelessWidget {
  const SuggestionScreen({super.key});

  @override
  Widget build(BuildContext context) {

    bool appMode=AppModeCubit.get(context).isDark;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: context.deviceHeight,
        padding: EdgeInsetsDirectional.symmetric(
            horizontal: context.deviceWidth * 0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: TextFormField(
                maxLength: 100,
                maxLines: 10,
                style: TextStyle(
                  color:appMode?DarkColors.textInFieldColor: LightColors.textInFieldColor
                ),
                decoration:   InputDecoration(

                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
              ),
            ),
            SizedBox(
              height: context.deviceHeight * 0.05,
            ),

            CustomBtn(hasBackground: true, onPressed:()=> _sendBtn(context), textChild: 'Send'.tr())


          ],
        ),
      ),
    );
  }

  void _sendBtn(context) {
    showThanksBottomSheet(context);

  }
  showThanksBottomSheet(context) {
    bool appMode=AppModeCubit.get(context).isDark;

    Navigator.pop(context);
    showModalBottomSheet
      (
        context: context,
        builder: (_) {
          return const ThanksScreen();
        },
        isScrollControlled: true,
        barrierColor: appMode?DarkColors.primary:LightColors.primary,
        useSafeArea: true);
  }

}
