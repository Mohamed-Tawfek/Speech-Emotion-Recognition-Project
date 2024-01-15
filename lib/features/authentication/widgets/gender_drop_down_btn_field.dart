import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../Languages_and_modes_controller/languages_and_mode_scubit_cubit.dart';
import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';

class GenderDropDownBtnField extends StatefulWidget {
    GenderDropDownBtnField({super.key, this.value,required this.isDark});
  final bool isDark;
 String? value;

  @override
  State<GenderDropDownBtnField> createState() => _GenderDropDownBtnFieldState();
}

class _GenderDropDownBtnFieldState extends State<GenderDropDownBtnField> {
  @override
  Widget build(BuildContext context) {
    bool appMode=LanguagesAndModesCubit.get(context).isDark;
    return DropdownButtonFormField(
      value: widget.value,
        decoration: InputDecoration(
            hintText: 'Choose Gender'.tr(),
            prefixIcon:  const Icon(Icons.man),
            // prefixIconColor: widget.isDark ? Colors.grey[100] : Colors.black54,
            //
            // hintStyle:
            //     TextStyle(color: widget.isDark ? Colors.grey[100] : Colors.black54),
            // fillColor: widget.isDark ? const Color(0xff242f3d) : Colors.grey[100],
            // filled: true,
            // enabledBorder: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(30),
            //     borderSide: const BorderSide(color: Colors.transparent)),
            // focusedBorder: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(30),
            //     borderSide: BorderSide(
            //         color: widget.isDark ? Colors.grey[100]! : Colors.black)),
            // errorBorder: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(30),
            //     borderSide: const BorderSide(color: Colors.red)),
            // border: OutlineInputBorder(
            //     borderSide: const BorderSide(),
            //     borderRadius: BorderRadius.circular(30))

        ),
        dropdownColor: appMode?DarkColors.textFieldColor: LightColors.textFieldColor,
        style: TextStyle(color: appMode?DarkColors.textColor: LightColors.textColor),
        items:   [
          DropdownMenuItem(
            value: 'Male',
            child: Text('Male'.tr()),
          ),
          DropdownMenuItem(
            value: 'Female',
            child: Text('Female'.tr()),
          ),
        ],
        onChanged: (v) {
        setState(() {
          widget.value=v;
        });
        });
  }
}
