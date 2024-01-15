import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/Languages_and_modes_controller/languages_and_mode_scubit_cubit.dart';
import 'package:speech_emotion_recognition_project/core/components/custom_btn.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/core/constants/dark_theme_colors.dart';
import 'package:speech_emotion_recognition_project/core/constants/light_theme_colors.dart';
import 'package:speech_emotion_recognition_project/features/speech/widgets/languages_ratios.dart';
import 'package:speech_emotion_recognition_project/features/speech/widgets/modes_radios.dart';

class SetupSettings extends StatefulWidget {
  SetupSettings({super.key});

  @override
  State<SetupSettings> createState() => _SetupSettingsState();
}

class _SetupSettingsState extends State<SetupSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<LanguagesAndModesCubit, LanguagesAndModeScubitState>(
        builder: (context, state) {
          bool appMode = LanguagesAndModesCubit.get(context).isDark;
           return Padding(
            padding: EdgeInsetsDirectional.only(
                start: context.deviceWidth * 0.07,
                end: context.deviceWidth * 0.07,
                bottom: context.deviceHeight * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Setup App Settings'.tr(),
                  style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: appMode
                          ? DarkColors.textColor
                          : LightColors.textColor),
                ),
                SizedBox(
                  height: context.deviceHeight * 0.05,
                ),
                Text(
                  'Language'.tr(),
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: appMode
                          ? DarkColors.textColor
                          : LightColors.textColor),
                ),
                LanguagesRadios(color: Colors.cyan),
                SizedBox(
                  height: context.deviceHeight * 0.05,
                ),
                Text(
                  'Mode'.tr(),
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: appMode
                          ? DarkColors.textColor
                          : LightColors.textColor),
                ),
                ModesRadios(color: Colors.pink),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: CustomBtn(
                        hasBackground: true,
                        onPressed: () async{

                          await  context.setLocale(const Locale('ar'));

                        },
                        textChild: 'Next'.tr()),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
