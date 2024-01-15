import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Languages_and_modes_controller/languages_and_mode_scubit_cubit.dart';
import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({super.key, required this.value, required this.attribute});

  final String attribute;
  final String value;

  @override
  Widget build(BuildContext context) {
    bool appMode=LanguagesAndModesCubit.get(context).isDark;
    return Row(
      children: [
        Text(
          attribute,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500,
          color: appMode?DarkColors.textColor: LightColors.textColor
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(fontSize: 15.sp, color:appMode?DarkColors.subtitleColor: LightColors.subtitleColor),
        )
      ],
    );
  }
}
