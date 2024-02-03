import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/features/authentication/screens/email_send_screen.dart';
import '../../../modes_controller/modes_cubit.dart';
import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';
import '../widgets/custom_text_field.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool appMode=AppModeCubit.get(context).isDark;
    return Scaffold(
      appBar: AppBar(

        surfaceTintColor:appMode?DarkColors.scaffoldColor: LightColors.scaffoldColor,

        centerTitle: true,
      ),
      body: SizedBox(
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
                if(context.locale.languageCode=='ar')

                  Text(
                    "نسيت كلمة مرورك؟".tr(),
                    style: TextStyle(fontSize: 30.sp,
                        color: appMode?DarkColors.textColor: LightColors.textColor,
                        fontWeight: FontWeight.bold),
                  ),
                if(context.locale.languageCode!='ar')
                  Text(
                  "Forgot Your Password?".tr(),
                  style: TextStyle(fontSize: 30.sp,
                      color: appMode?DarkColors.textColor: LightColors.textColor,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Enter your registered email'.tr(),
                  style: TextStyle(
                    color: appMode?DarkColors.textColor: LightColors.textColor,
                    fontSize: 18.sp,
                  ),
                ),
                Text(
                  'below to receive password reset instruction'.tr(),
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: appMode?DarkColors.textColor: LightColors.textColor,
                  ),
                ),
                Lottie.asset(
                    width: context.deviceWidth * 0.7,
                    height: context.deviceHeight * 0.40,
                    fit: BoxFit.cover,
                    'assets/lotties/forget.json'),
                SizedBox(
                  height: context.deviceHeight * 0.03,
                ),
                CustomTextField(
                  controller: emailController,
                  hintText: 'Enter Email'.tr(),
                  prefixIcon: const Icon(Icons.email_outlined),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: context.deviceHeight * 0.03,
                ),
                Container(
                  height: context.deviceHeight * 0.08,
                  width: context.deviceWidth,
                  decoration: BoxDecoration(
                      color: appMode?DarkColors.primary: LightColors.primary,
                      borderRadius: BorderRadius.circular(30)),
                  child: MaterialButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: ()=>_sendLink(context),
                    child: Text(
                      'Send Reset Link'.tr(),
                      style: TextStyle(color: appMode?DarkColors.scaffoldColor: LightColors.scaffoldColor,


                          fontSize: 18.sp),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _sendLink(BuildContext context) {
    context.pushAndRemoveUntil(SendEmailScreen(forConfirm: false,));
  }
}
