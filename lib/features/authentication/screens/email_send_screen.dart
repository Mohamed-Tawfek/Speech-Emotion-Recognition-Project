import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/features/authentication/screens/login_screen.dart';

import '../../../Languages_and_modes_controller/mode_scubit_cubit.dart';
import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';

class SendEmailScreen extends StatelessWidget {
  SendEmailScreen({super.key, this.forConfirm = true});
  final bool forConfirm;
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool appMode = AppModeCubit.get(context).isDark;
    return Scaffold(

      body: SafeArea(
        child: SizedBox(
          width: context.deviceWidth,
          height: context.deviceHeight,
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: context.deviceWidth * 0.07,
              //vertical: context.deviceHeight*0.01
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email has been sent!'.tr(),
                    style: TextStyle(
                        fontSize: 30.sp,
                        color: appMode
                            ? DarkColors.textColor
                            : LightColors.textColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Please check your inbox and '.tr(),
                    style: TextStyle(
                      fontSize: 18.sp,
                      color:  appMode
                          ? DarkColors.textColor
                          : LightColors.textColor
                    ),
                  ),
                  Text(
                    forConfirm
                        ? 'click in the received link to confirm your account'.tr()
                        : 'click in the received link to reset a password'.tr(),
                    style: TextStyle(
                      fontSize: 18.sp,
                      color:  appMode
                          ? DarkColors.textColor
                          : LightColors.textColor
                    ),
                  ),
                  Lottie.asset(
                      width: context.deviceWidth * 0.5,
                      height: context.deviceHeight * 0.45,
                      fit: BoxFit.cover,
                      'assets/lotties/send.json'),
                  SizedBox(
                    height: context.deviceHeight * 0.03,
                  ),
                  SizedBox(
                    height: context.deviceHeight * 0.03,
                  ),
                  Container(
                    height: context.deviceHeight * 0.08,
                    width: context.deviceWidth,
                    decoration: BoxDecoration(
                        color: appMode?DarkColors.primary:LightColors.primary,
                        borderRadius: BorderRadius.circular(30)),
                    child: MaterialButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () => _login(context),
                      child: Text(
                        'Login'.tr(),
                        style: TextStyle(color:  appMode
                            ? DarkColors.scaffoldColor
                            : LightColors.scaffoldColor, fontSize: 18.sp),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.deviceHeight * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Didn\'t receive the link?'.tr(),
                        style: TextStyle(fontSize: 13.sp, color:  appMode
                            ? DarkColors.textColor
                            : LightColors.textColor),
                      ),
                      TextButton(
                          style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent)),
                          onPressed: _resendLink,
                          child: Text(
                            'Resend'.tr(),
                            style: TextStyle(
                                fontSize: 13.sp, color:  appMode?DarkColors.primary:LightColors.primary),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    context.pushAndRemoveUntil(LoginScreen());
  }

  void _resendLink() {}
}
