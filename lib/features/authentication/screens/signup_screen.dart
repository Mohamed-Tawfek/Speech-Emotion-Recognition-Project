import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/features/authentication/screens/set_user_image_screen.dart';

import '../../../Languages_and_modes_controller/languages_and_mode_scubit_cubit.dart';
import '../../../core/components/custom_btn.dart';
import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/gender_drop_down_btn_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  bool _obsecurePassword = true;
  @override
  Widget build(BuildContext context) {
    bool appMode=LanguagesAndModesCubit.get(context).isDark;
    return Scaffold(
      // backgroundColor: Color(0xff0e1621),
       appBar: AppBar(
          surfaceTintColor:appMode?DarkColors.scaffoldColor: LightColors.scaffoldColor,
        title:   Text('Sign up'.tr(),


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
                    style: TextStyle(fontSize: 25.sp, color: appMode?DarkColors.textColor: LightColors.textColor),
                  ),
                  SizedBox(
                    height: context.deviceHeight * 0.008,
                  ),
                  Text(
                    'Create your account'.tr(),
                    style: TextStyle(fontSize: 13.sp, color: appMode?DarkColors.textColor: LightColors.textColor),
                  ),
                  SizedBox(
                    height: context.deviceHeight * 0.05,
                  ),
                  CustomTextField(
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
                    controller: userNameController,
                    prefixIcon: const Icon(Icons.person),
                    hintText: 'Enter Username'.tr(),
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
                  CustomTextField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    prefixIcon: const Icon(Icons.numbers),
                    hintText: 'Enter Age'.tr(),
                  ),
                  SizedBox(
                    height: context.deviceHeight * 0.05,
                  ),
                  GenderDropDownBtnField(isDark: false),
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
    );
  }

  void _signup(BuildContext context) {
    context.pushAndRemoveUntil(const SetUserImageScreen());
  }
}
