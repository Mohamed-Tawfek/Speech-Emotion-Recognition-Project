import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';

import '../../../Languages_and_modes_controller/languages_and_mode_scubit_cubit.dart';
import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';

class SwitchLanguageWidget extends StatelessWidget {
  const SwitchLanguageWidget({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {

    bool appMode=LanguagesAndModesCubit.get(context).isDark;
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
          horizontal: context.deviceWidth * 0.01),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          childrenPadding: const EdgeInsetsDirectional.all(0),
          tilePadding: EdgeInsetsDirectional.symmetric(
              horizontal: context.deviceWidth * 0.05),
          leading: Icon(
            Icons.language,
            size: 18.sp,
          ),
          iconColor: color,
          collapsedIconColor: color,
          title: Text(
            'Language'.tr(),
            style:  TextStyle(
              color: color,
              fontSize: 15.sp
          ),
          ),
          subtitle:   Text(LanguagesAndModesCubit.get(context).isArabic?'العربية':'English',

          style: TextStyle(
              color: appMode?DarkColors.subtitleColor:
              LightColors.subtitleColor, fontSize: 10.sp),

          ),

          children: const <Widget>[
            LanguagesRadios(color: Color(0xffCA4B7F)),
          ],
        ),
      ),
    );
  }
}

enum Languages { English, Arabic }

class LanguagesRadios extends StatefulWidget {
  const LanguagesRadios({super.key, required this.color});
  final Color color;

  @override
  State<LanguagesRadios> createState() => _RadioListTileState();
}

class _RadioListTileState extends State<LanguagesRadios> {
  Languages _character = Languages.English;

  @override
  Widget build(BuildContext context) {
    double textRadiosSize = 12.sp;
    bool appMode=LanguagesAndModesCubit.get(context).isDark;

    return Column(
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(dividerColor: widget.color),
          child: RadioListTile<Languages>(
            activeColor: widget.color,
            title: Text(
              'English',
              style: TextStyle(fontSize: textRadiosSize,

                  color: appMode?DarkColors.textColor: LightColors.textColor

              ),
            ),
            value: Languages.English,
            groupValue: _character,
            onChanged: (Languages? value) {
              LanguagesAndModesCubit.get(context).changeAppLanguageToEN(context);

              setState(() {
                _character = value!;
              });
            },
          ),
        ),
        RadioListTile<Languages>(
          activeColor: widget.color,
          title: Text(
            'العربية',
            style: TextStyle(fontSize: textRadiosSize,

                color: appMode?DarkColors.textColor: LightColors.textColor

            ),
          ),
          value: Languages.Arabic,
          groupValue: _character,
          onChanged: (Languages? value) {
            LanguagesAndModesCubit.get(context).changeAppLanguageToAR(context);
            setState(() {
              _character = value!;
            });
          },
        ),
      ],
    );
  }
}
