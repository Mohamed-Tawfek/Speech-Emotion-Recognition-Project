import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';

import '../../../Languages_and_modes_controller/mode_scubit_cubit.dart';
import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';

class SwitchModeWidget extends StatelessWidget {
  const SwitchModeWidget({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    bool appMode = AppModeCubit.get(context).isDark;

    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
          horizontal: context.deviceWidth * 0.01),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          childrenPadding: const EdgeInsetsDirectional.all(0),
          tilePadding: EdgeInsetsDirectional.symmetric(
              horizontal: context.deviceWidth * 0.05),
          iconColor: color,
          collapsedIconColor: color,
          leading: Icon(
            Icons.change_circle,
            size: 18.sp,
          ),
          subtitle: Text(
            appMode?'Dark'.tr():'Light'.tr(),
            style: TextStyle(
                color: appMode
                    ? DarkColors.subtitleColor
                    : LightColors.subtitleColor,
                fontSize: 10.sp),
          ),
          title: Text(
            'Mode'.tr(),
            style: TextStyle(color: color, fontSize: 15.sp),
          ),
          children:   <Widget>[
            ModesRadios(color: appMode?DarkColors.primary:LightColors.primary,),
          ],
        ),
      ),
    );
  }
}

enum Modes { Dark, Light }

class ModesRadios extends StatefulWidget {
  const ModesRadios({super.key, required this.color});
  final Color color;
  @override
  State<ModesRadios> createState() => _ModesRadiosState();
}

class _ModesRadiosState extends State<ModesRadios> {
  @override
  Widget build(BuildContext context) {
    double textRadiosSize = 12.sp;
    bool appMode = AppModeCubit.get(context).isDark;
    Modes character = AppModeCubit.get(context).isDark
        ? Modes.Dark
        : Modes.Light;

    return Column(
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(dividerColor: appMode?DarkColors.dividerColor:LightColors.dividerColor),
          child: RadioListTile<Modes>(
            activeColor: widget.color,
            title: Text(
              'Light'.tr(),
              style: TextStyle(
                  fontSize: textRadiosSize,
                  color:
                      appMode ? DarkColors.textColor : LightColors.textColor),
            ),
            value: Modes.Light,
            groupValue: character,
            onChanged: (Modes? value) {
              AppModeCubit.get(context).changeAppMode();

              setState(() {
                character = value!;
              });
            },
          ),
        ),
        RadioListTile<Modes>(
          activeColor: widget.color,
          title: Text(
            'Dark'.tr(),
            style: TextStyle(
                fontSize: textRadiosSize,
                color: appMode ? DarkColors.textColor : LightColors.textColor),
          ),
          value: Modes.Dark,
          groupValue: character,
          onChanged: (Modes? value) {
            AppModeCubit.get(context).changeAppMode();

            setState(() {
              character = value!;
            });
          },
        ),
      ],
    );
  }
}
