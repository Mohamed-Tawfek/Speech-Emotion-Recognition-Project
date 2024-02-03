import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';

 import '../../../core/components/custom_btn.dart';
import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';
import '../../../modes_controller/modes_cubit.dart';
import '../../authentication/widgets/custom_text_field.dart';

class ChangeAccountScreen extends StatelessWidget {
   ChangeAccountScreen({super.key});
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  bool _obsecurePassword = true;

  @override
  Widget build(BuildContext context) {
    bool appMode=AppModeCubit.get(context).isDark;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(
            vertical: context.deviceHeight * 0.05,
            horizontal: context.deviceWidth * 0.07),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Change Password'.tr(),
              style: TextStyle(fontSize: 25.sp, color: appMode?DarkColors.textColor: LightColors.textColor),
            ),
            SizedBox(
              height: context.deviceHeight * 0.05,
            ),
            StatefulBuilder(builder: (c, setState) {
              return CustomTextField(
                controller: oldPasswordController,
                prefixIcon: const Icon(Icons.lock_outlined),
                hintText: 'Old Password'.tr(),
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
            StatefulBuilder(builder: (c, setState) {
              return CustomTextField(
                controller: newPasswordController,
                prefixIcon: const Icon(Icons.lock_outlined),
                hintText: 'New Password'.tr(),
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
            Center(
              child: CustomBtn(
                hasBackground: true,
                onPressed: ()=>_change(context),
                textChild: 'Change'.tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _change(BuildContext context) {
    context.pop();

  }
}
