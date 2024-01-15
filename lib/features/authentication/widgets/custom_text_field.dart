import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../Languages_and_modes_controller/languages_and_mode_scubit_cubit.dart';
import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.suffixIcon,
      this.prefixIcon,
      required this.hintText,
      this.radius,
      this.onPressedSuffixIcon,
      this.keyboardType,
      this.obscureText = false,
      required this.controller});

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function()? onPressedSuffixIcon;
  final String hintText;
  final TextEditingController controller;
  final double? radius;
  final TextInputType? keyboardType;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    bool appMode=LanguagesAndModesCubit.get(context).isDark;

    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: TextStyle(
        color:appMode?DarkColors.textInFieldColor: LightColors.textInFieldColor
      ),
      controller: controller,
       // cursorColor: isDark ? Colors.grey[100] : Colors.black54,
      decoration: InputDecoration(

          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon != null
              ? IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  icon: suffixIcon!,
                  onPressed: onPressedSuffixIcon,
                )
              : null,
          hintText: hintText,

          filled: true,

          // focusedBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(radius ?? 30),
          //     borderSide:
          //         BorderSide(color: isDark ? Colors.grey[100]! : Colors.black)),
          //
          // enabledBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(radius ?? 30),
          //     borderSide: const BorderSide(color: Colors.transparent)),
          // errorBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(radius ?? 30),
          //     borderSide: const BorderSide(color: Colors.red)),
          // border: OutlineInputBorder(
          //     borderSide: const BorderSide(),
          //     borderRadius: BorderRadius.circular(radius ?? 30))

      ),
    );
  }
}
