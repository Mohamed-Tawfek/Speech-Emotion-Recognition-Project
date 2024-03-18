
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/features/account/widgets/setting_action_btn.dart';

import '../../../core/components/dialogs.dart';
import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';
import '../../../modes_controller/modes_cubit.dart';
import '../controller/account/account_cubit.dart';
import '../models/user_model.dart';
import '../screens/change_account_info.dart';
import '../screens/change_password_screen.dart';
import 'info_widget.dart';

class SettingsOptions extends StatelessWidget {
  const SettingsOptions(
      {super.key,
        required this.birthdate,
        required this.phone,
        required this.gender,
        required this.model});

  final String phone;
  final String gender;
  final String birthdate;
  final UserModel model;

  @override
  Widget build(BuildContext context) {
    bool appMode = AppModeCubit.get(context).isDark;

    return Container(
      height: context.deviceHeight * 0.65,
      padding: EdgeInsetsDirectional.symmetric(
          horizontal: context.deviceWidth * 0.03,
          vertical: context.deviceHeight * 0.04),
      decoration: BoxDecoration(
        color: appMode ? DarkColors.scaffoldColor : LightColors.scaffoldColor,
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            InfoWidget(
              birthdate: birthdate,
              gender: gender,
              phone: phone,
            ),
            SizedBox(
              height: context.deviceHeight * 0.03,
            ),
            SettingActionBtn(
                text: 'Change account info'.tr(),
                icon: Icons.change_circle,
                onTap: () => _changeAccountInfo(context, model)),
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
                onTap: () => _deleteAccountBtn(context)),
          ],
        ),
      ),
    );
  }

  _deleteAccountBtn(BuildContext context) {
    showConfirmDialog(context, () {
      AccountCubit.removeAccount(context);
    }, 'Are you sure you want to\n remove your account?!'.tr());
  }

  _changePasswordBtn(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        useSafeArea: true,
        context: context,
        builder: (c) => ChangeAccountScreen());
  }

  _changeAccountInfo(BuildContext context, UserModel model) {
    showModalBottomSheet(
        isScrollControlled: true,
        useSafeArea: true,
        context: context,
        builder: (c) =>   ChangeAccountInfo(

        ));
  }
}
