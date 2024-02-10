import 'package:dateofbirth/dateofbirth.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/features/authentication/screens/set_user_image_screen.dart';

import '../../../core/components/change_mode_widget.dart';
import '../../../modes_controller/modes_cubit.dart';
import '../../../core/components/custom_btn.dart';
import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/gender_drop_down_btn_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
   bool _obsecurePassword = true;

  int selectedDay = DateTime.now().day;
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;
  @override
  Widget build(BuildContext context) {
    bool appMode = AppModeCubit.get(context).isDark;
    return Scaffold(
      // backgroundColor: Color(0xff0e1621),
      appBar: AppBar(
        surfaceTintColor:
            appMode ? DarkColors.scaffoldColor : LightColors.scaffoldColor,
        title: Text(
          'Sign up'.tr(),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
              vertical: context.deviceHeight * 0.05,
              horizontal: context.deviceWidth * 0.07),
          child: SizedBox(
            width: context.deviceWidth,
            child: Center(
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/app_icon.png',
                      height: context.deviceHeight * 0.15,
                      width: context.deviceWidth * 0.3,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      'Welcome!'.tr(),
                      style: TextStyle(
                          fontSize: 25.sp,
                          color: appMode
                              ? DarkColors.textColor
                              : LightColors.textColor),
                    ),
                    SizedBox(
                      height: context.deviceHeight * 0.008,
                    ),
                    Text(
                      'Create your account'.tr(),
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: appMode
                              ? DarkColors.textColor
                              : LightColors.textColor),
                    ),
                    SizedBox(
                      height: context.deviceHeight * 0.05,
                    ),
                    CustomTextField(
                      validator: (String? email) {
                        if (email == null) {
                          return 'this field is required!'.tr();
                        }
                        final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(email);
                         if (!emailValid) {
                          return 'Enter a valid email'.tr();
                        } else {
                          return null;
                        }
                      },
                      controller: emailController,
                      hintText: 'Enter Email'.tr(),
                      prefixIcon: const Icon(Icons.email_outlined),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: context.deviceHeight * 0.05,
                    ),
                    StatefulBuilder(builder: (c, setState) {
                      return CustomTextField(
                        validator: (password){

                          if (password == null) {
                            return 'this field is required!'.tr();
                          }

                          if (password.length<6) {
                            return 'The password must not be less than 6 characters'.tr();
                          } else {
                            return null;
                          }
                        },
                        controller: passwordController,
                        prefixIcon: const Icon(Icons.lock_outlined),
                        hintText: 'Enter Password'.tr(),
                        obscureText: _obsecurePassword,
                        onPressedSuffixIcon: () {
                          setState(() {
                            _obsecurePassword = !_obsecurePassword;
                          });
                        },
                        suffixIcon: _obsecurePassword
                            ? const Icon(Icons.visibility_off_rounded)
                            : const Icon(Icons.visibility),
                      );
                    }),
                    SizedBox(
                      height: context.deviceHeight * 0.05,
                    ),
                    CustomTextField(
                      controller: firstNameController,
                      prefixIcon: const Icon(Icons.person),
                      hintText: 'Enter First Name'.tr(),
                    ),
                    SizedBox(
                      height: context.deviceHeight * 0.05,
                    ),
                    CustomTextField(
                      controller: lastNameController,
                      prefixIcon: const Icon(Icons.person),
                      hintText: 'Enter Last Name'.tr(),
                    ),
                    SizedBox(
                      height: context.deviceHeight * 0.05,
                    ),
                    CustomTextField(
                      controller: phoneController,
                      prefixIcon: const Icon(Icons.phone),
                      hintText: 'Enter Phone'.tr(),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: context.deviceHeight * 0.05,
                    ),
                    GenderDropDownBtnField(isDark: false),
                    SizedBox(
                      height: context.deviceHeight * 0.05,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Enter your BirthDate:'.tr(),
                          style: TextStyle(
                              color: appMode
                                  ? DarkColors.textColor
                                  : LightColors.textColor,
                              fontSize: 15.sp),
                        )),
                    SizedBox(
                      height: context.deviceHeight * 0.03,
                    ),
                    DateOfBirth(
                      radius: 20,
                      backgroundColor: appMode
                          ? DarkColors.textFieldColor
                          : LightColors.textFieldColor,
                      yearSize: Size(context.deviceWidth * 0.25, 40),
                      daySize: Size(context.deviceWidth * 0.25, 40),
                      monthSize: Size(context.deviceWidth * 0.25, 40),
                      itemColor: appMode
                          ? DarkColors.textInFieldColor
                          : LightColors.textInFieldColor,
                      textsSize: 15.sp,
                      borderColor: Colors.black,
                      itemsColor: appMode
                          ? DarkColors.textColor
                          : LightColors.textColor,
                      backgroundDropdownColor: appMode
                          ? DarkColors.scaffoldColor
                          : LightColors.scaffoldColor,
                      onDateTimeChanged: (datetime) {
                        selectedDay = datetime.day;
                        selectedMonth = datetime.month;
                        selectedYear = datetime.year;
                      },
                    ),
                    SizedBox(
                      height: context.deviceHeight * 0.05,
                    ),
                    CustomBtn(
                      hasBackground: true,
                      onPressed: () => _signup(context),
                      textChild: 'Sign up'.tr(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signup(BuildContext context) {
    if (_formKey.currentState!.validate()) {

      context.push(SetUserImageScreen(
        birthDate: "$selectedMonth/$selectedDay/$selectedYear",
        email: emailController.text,
        firstName: firstNameController.text,
        gender: chosenGenderValue!,
        lastName: lastNameController.text,
        password: passwordController.text,
        phone: phoneController.text,
      ));
    }

    //  print(selectedMonth);
    //  print(selectedYear);
  }
}
