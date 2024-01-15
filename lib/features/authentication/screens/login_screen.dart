
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/Languages_and_modes_controller/languages_and_mode_scubit_cubit.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/core/constants/dark_theme_colors.dart';
import 'package:speech_emotion_recognition_project/core/constants/light_theme_colors.dart';
import 'package:speech_emotion_recognition_project/features/authentication/screens/forget_password.dart';
import 'package:speech_emotion_recognition_project/features/authentication/screens/signup_screen.dart';
import 'package:speech_emotion_recognition_project/features/speech/screens/speech_screen.dart';

import '../../../core/components/custom_btn.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obsecurePassword=true;

  @override
  Widget build(BuildContext context) {
    bool appMode=LanguagesAndModesCubit.get(context).isDark;
    return Scaffold(
      // backgroundColor: Color(0xff0e1621),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(
            horizontal: context.deviceWidth * 0.07,
            vertical: context.deviceHeight * 0.03),
        child: SafeArea(
          child: SizedBox(
            width: context.deviceWidth,
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
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
                      'Welcome back!'.tr(),
                      style: TextStyle(fontSize: 25.sp, color:appMode?DarkColors.textColor: LightColors.textColor),
                    ),
                    SizedBox(
                      height: context.deviceHeight * 0.008,
                    ),
                    Text(
                      'Login to your account'.tr(),
                      style: TextStyle(fontSize: 13.sp,
                          color: appMode?DarkColors.textColor: LightColors.textColor),
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
                    StatefulBuilder(builder: (c,setState){
                      return   CustomTextField(
                        controller: passwordController,
                        prefixIcon: const Icon(Icons.lock_outlined),
                        hintText: 'Enter Password'.tr(),
                        obscureText: _obsecurePassword,
                        onPressedSuffixIcon: () {
                          setState((){
                            _obsecurePassword=!_obsecurePassword;
                          });
                        },
                        suffixIcon:_obsecurePassword?const Icon(Icons.visibility_off_rounded): const Icon(Icons.visibility),
                      );
                    }),

                    SizedBox(
                      height: context.deviceHeight * 0.005,
                    ),
                    TextButton(
                      onPressed:()=> _forgotPassword((context)),
                      style:ButtonStyle(

                          overlayColor: MaterialStateProperty.all(Colors.transparent)
                      ) ,

                      child: Text(
                        'Forgot your password?'.tr(),
                        style: TextStyle(
                          color:appMode?DarkColors.primary: LightColors.primary,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: context.deviceHeight * 0.05,
                    ),
                    CustomBtn(
                      hasBackground: true,
                      onPressed:()=> _login(context),
                      textChild: 'Login'.tr(),
                    ),
                    SizedBox(
                      height: context.deviceHeight * 0.08,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text(
                          'Don\'t have an account?'.tr(),
                          style:
                              TextStyle(fontSize: 13.sp,
                                  color:   appMode?DarkColors.textColor: LightColors.textColor),
                        ),
                        TextButton(
                          style:ButtonStyle(

                            overlayColor: MaterialStateProperty.all(Colors.transparent)
                           ) ,
                            onPressed:()=>_signup(context),

                            child: Text(
                              'Sign up'.tr(),
                              style: TextStyle(
                                  fontSize: 13.sp, color: appMode?DarkColors.primary: LightColors.primary),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context){
    context.push(SpeechScreen());
  }

  void _signup(BuildContext context){
    context.push(SignUpScreen());



  }

  void _forgotPassword(BuildContext context) {
    context.push(ForgetPassword());

  }

}
