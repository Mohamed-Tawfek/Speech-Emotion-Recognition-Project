import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/dialogs.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/features/account/controller/account/account_cubit.dart';
import 'package:speech_emotion_recognition_project/features/account/models/user_model.dart';
import 'package:speech_emotion_recognition_project/features/account/screens/change_account_info.dart';
import 'package:speech_emotion_recognition_project/features/authentication/screens/login_screen.dart';
import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';
import '../../../modes_controller/modes_cubit.dart';
import '../../speech/widgets/drawer_components.dart';
import '../widgets/info_widget.dart';
import '../widgets/setting_action_btn.dart';
import '../widgets/settings_options.dart';
import 'change_password_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool appMode = AppModeCubit.get(context).isDark;
    return BlocProvider(
      create: (
        context,
      ) =>
          AccountCubit()..getAccountInfo(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:
              appMode ? DarkColors.scaffoldColor : LightColors.primary,
          systemOverlayStyle: SystemUiOverlayStyle(
              //colo: appMode?DarkColors.scaffoldColor:LightColors.primary
              statusBarColor:
                  appMode ? DarkColors.scaffoldColor : LightColors.primary),
          // backgroundColor: const Color(0xffd8135a),
          title: Text(
            'Account'.tr(),
            style:
                TextStyle(color: appMode ? DarkColors.textColor : Colors.white),
          ),
          leading: IconButton(
              onPressed: () => context.pop(),
              icon: Icon(Icons.arrow_back_ios,
                  color: appMode ? DarkColors.textColor : Colors.white)),
        ),
        body: BlocBuilder<AccountCubit, AccountState>(
          builder: (context, state) {
            AccountCubit cubit = AccountCubit.get(context);

            return cubit.userModel == null
                ? Center(
                    child: CircularProgressIndicator(
                      color: appMode ? DarkColors.primary : LightColors.primary,
                    ),
                  )
                : RefreshIndicator(
                    backgroundColor:
                        appMode ? DarkColors.primary : LightColors.primary,
                    color: appMode
                        ? DarkColors.scaffoldColor
                        : LightColors.scaffoldColor,
                    onRefresh: () {
                      return cubit.getAccountInfo();
                    },
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          color: appMode
                              ? DarkColors.scaffoldColor
                              : LightColors.primary,
                          child: SizedBox(
                            width: context.deviceWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (cubit.userModel!.imgCover != null)
                                  BuildDrawerImage(
                                    url: cubit.userModel!.imgCover!,
                                  ),
                                if (cubit.userModel!.imgCover == null)
                                  const NotFoundImageUser(),
                                SizedBox(
                                  height: context.deviceHeight * 0.01,
                                ),
                                Text(
                                  cubit.userModel!.fullName,
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  cubit.userModel!.email,
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
                          model: cubit.userModel!,
                          birthdate:
                              '${cubit.userModel!.day}/${cubit.userModel!.month}/${cubit.userModel!.year}',
                          gender: cubit.userModel!.gender.tr(),
                          phone: cubit.userModel!.phone.toString(),
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
