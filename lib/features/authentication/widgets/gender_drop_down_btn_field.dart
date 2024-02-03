import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../modes_controller/modes_cubit.dart';
import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';

String? chosenGenderValue;

class GenderDropDownBtnField extends StatefulWidget {
  GenderDropDownBtnField({super.key, required this.isDark});
  final bool isDark;

  @override
  State<GenderDropDownBtnField> createState() => _GenderDropDownBtnFieldState();
}

class _GenderDropDownBtnFieldState extends State<GenderDropDownBtnField> {
  @override
  Widget build(BuildContext context) {
    bool appMode = AppModeCubit.get(context).isDark;
    return DropdownButtonFormField(
        value: chosenGenderValue,
        validator: (String? gender ){
          if(gender==null||gender.isEmpty){
            return 'Gender is required'.tr();
          }
          else {
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: 'Choose Gender'.tr(),
          prefixIcon: const Icon(Icons.man),
        ),
        dropdownColor:
            appMode ? DarkColors.textFieldColor : LightColors.textFieldColor,
        style: TextStyle(
            color: appMode ? DarkColors.textColor : LightColors.textColor),
        items: [
          DropdownMenuItem(
            value: 'male',
            child: Text('Male'.tr()),
          ),
          DropdownMenuItem(
            value: 'female',
            child: Text('Female'.tr()),
          ),
        ],
        onChanged: (v) {
          setState(() {
            chosenGenderValue = v;
          });
        });
  }
}
