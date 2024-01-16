import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/features/account/controller/account_cubit.dart';
import 'package:speech_emotion_recognition_project/features/account/screens/change_account_info.dart';
import 'package:speech_emotion_recognition_project/features/authentication/screens/login_screen.dart';
import '../../../Languages_and_modes_controller/mode_scubit_cubit.dart';
import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';
import '../../speech/widgets/drawer_components.dart';
import '../widgets/info_widget.dart';
import '../widgets/setting_action_btn.dart';
import 'change_password_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool appMode=AppModeCubit.get(context).isDark;
    return BlocProvider(
      create: (context) => AccountCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appMode?DarkColors.scaffoldColor: LightColors.primary,
          systemOverlayStyle: SystemUiOverlayStyle(
            //colo: appMode?DarkColors.scaffoldColor:LightColors.primary
            statusBarColor: appMode?DarkColors.scaffoldColor:LightColors.primary
          ),
          // backgroundColor: const Color(0xffd8135a),
          title:   Text(
            'Account'.tr(),
            style: TextStyle(
              color: appMode?DarkColors.textColor: Colors.white
            ),
          ),
          leading: IconButton(
              onPressed: () => context.pop(),
              icon:   Icon(
                Icons.arrow_back_ios,
color: appMode?DarkColors.textColor: Colors.white
              )),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              color: appMode?DarkColors.scaffoldColor: LightColors.primary,
              child: SizedBox(
                width: context.deviceWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const BuildDrawerImage(
                      url:
                      'https://firebasestorage.googleapis.com/v0/b/social-app-c6d04.appspot.com/o/%D9%A2%D9%A0%D9%A2%D9%A1%D9%A0%D9%A2%D9%A2%D9%A2_%D9%A1%D9%A4%D9%A2%D9%A1%D9%A4%D9%A8.jpg?alt=media&token=91863248-968c-4abe-934f-da04f3cce306',
                    )      ,              SizedBox(
                      height: context.deviceHeight * 0.01,
                    ),
                    Text(
                      'Mohamed Tawfek',
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'mohamed@gmail.com',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.grey[100],
                      ),
                    )
                  ],
                ),
              ),
            ),
              SettingsOptions(
              age: '21',
              gender: 'Male'.tr(),
              phone: '0123456789',
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsOptions extends StatelessWidget {
  const SettingsOptions(
      {super.key,
      required this.age,
      required this.phone,
      required this.gender});

  final String phone;
  final String gender;
  final String age;

  @override
  Widget build(BuildContext context) {
    bool appMode=AppModeCubit.get(context).isDark;

    return Container(
      height: context.deviceHeight * 0.65,
      padding: EdgeInsetsDirectional.symmetric(
          horizontal: context.deviceWidth * 0.03,
          vertical: context.deviceHeight * 0.04),
      decoration:   BoxDecoration(
        color: appMode?DarkColors.scaffoldColor: LightColors.scaffoldColor,
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            InfoWidget(
              age: age,
              gender: gender,
              phone: phone,
            ),
            SizedBox(
              height: context.deviceHeight * 0.03,
            ),
            SettingActionBtn(
                text: 'Change account info'.tr(),
                icon: Icons.change_circle,
                onTap: () => _changeAccountInfo(context)),
            SizedBox(
              height: context.deviceHeight * 0.03,
            ),
            SettingActionBtn(
                text: 'Change password'.tr(),
                icon: Icons.lock,
                onTap: () => _changePasswordBtn(context)),
            SizedBox(
              height: context.deviceHeight * 0.03,
            ),
            SettingActionBtn(
                text: 'Delete my account'.tr(),
                icon: Icons.delete,
                color: Colors.red,
                onTap:()=> _deleteAccountBtn(context)),
          ],
        ),
      ),
    );
  }

  _deleteAccountBtn(BuildContext context) {
    context.pushAndRemoveUntil(LoginScreen());

  }

  _changePasswordBtn(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        useSafeArea: true,
        context: context,
        builder: (c) => ChangeAccountScreen());
  }

  _changeAccountInfo(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        useSafeArea: true,
        context: context,
        builder: (c) => ChangeAccountInfo());
  }
}
