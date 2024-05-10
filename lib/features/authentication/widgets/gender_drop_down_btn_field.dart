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
            return 'Gender is required' ;
          }
          else {
            return null;
          }
        },
        decoration: const InputDecoration(
          hintText: 'Choose Gender' ,
          prefixIcon: Icon(Icons.man),
        ),
        dropdownColor:
            appMode ? DarkColors.textFieldColor : LightColors.textFieldColor,
        style: TextStyle(
            color: appMode ? DarkColors.textColor : LightColors.textColor),
        items: const [
          DropdownMenuItem(
            value: 'male',
            child: Text('Male' ),
          ),
          DropdownMenuItem(
            value: 'female',
            child: Text('Female' ),
          ),
        ],
        onChanged: (v) {
          setState(() {
            chosenGenderValue = v;
          });
        });
  }
}
