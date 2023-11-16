import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_strings.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton(
      {Key? key,
      required this.function,
      required this.text,
      this.isUpperCase = true,
      this.radius = 10.0,
      this.color})
      : super(key: key);

  // Color background = Colors.green,
  bool isUpperCase = true;
  double radius;
  VoidCallback function;
  String text;
  Color? color;
  @override
  Widget build(BuildContext context) {
    // if (color == null) {
    //   color = ModeCubit.isDark ? DarkColors.button : LightColors.button;
    // }
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
      ),
      child: MaterialButton(
        color: color,
        onPressed: function,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.transparent)),
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
              // color: ModeCubit.isDark
              //     ? DarkColors.buttonChild
              //     : LightColors.buttonChild,
              fontSize: 18.sp),
        ),
      ),
    );
  }
}

class DefaultFormField extends StatelessWidget {
  DefaultFormField(
      {Key? key,
      required this.controller,
      this.type,
      this.onSubmit,
      this.onChange,
      this.isPassword = false,
      this.validate,
      this.label,
      this.prefix,
      this.suffix,
      this.suffixOnPressed,
      this.hint,
      this.isEnable = true})
      : super(key: key);

  TextEditingController? controller;
  TextInputType? type;
  Function(String)? onSubmit;
  Function(String)? onChange;
  bool isPassword;
  String? Function(String?)? validate;
  String? label;
  String? hint;
  IconData? prefix;
  IconData? suffix;
  void Function()? suffixOnPressed;
  bool isEnable;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        style: TextStyle(
            //  color: ModeCubit.isDark ? DarkColors.text : LightColors.text
            ),
        controller: controller,
        enabled: isEnable,
        keyboardType: type,
        obscureText: isPassword,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        validator: validate ??
            (val) {
              if (val == null || val.isEmpty) {
                return AppStrings.requiredField;
              }
              return null;
            },
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          hintStyle: TextStyle(
              // color: ModeCubit.isDark ? DarkColors.textField : LightColors.text
              ),
          labelStyle: TextStyle(
              //color: ModeCubit.isDark ? DarkColors.textField : LightColors.text

              ),
          prefixIcon: prefix != null
              ? Icon(
                  prefix,
                  // color: ModeCubit.isDark ? DarkColors.text : LightColors.text,
                )
              : null,
          suffixIcon: suffix != null
              ? IconButton(
                  icon: Icon(suffix),
                  onPressed: suffixOnPressed,
                  // color: ModeCubit.isDark ? DarkColors.text : LightColors.text,
                )
              : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  // color: ModeCubit.isDark
                  //     ? DarkColors.textField
                  //     : LightColors.textField
                  ),
              borderRadius: BorderRadius.circular(20.0)),
        ),
      ),
    );
  }
}
