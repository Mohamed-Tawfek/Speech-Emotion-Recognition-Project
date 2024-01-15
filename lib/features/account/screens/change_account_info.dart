import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/features/account/controller/account_cubit.dart';

import '../../../Languages_and_modes_controller/languages_and_mode_scubit_cubit.dart';
import '../../../core/components/custom_btn.dart';
import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';
import '../../authentication/widgets/custom_text_field.dart';
import '../../authentication/widgets/gender_drop_down_btn_field.dart';
import '../../speech/widgets/drawer_components.dart';

class ChangeAccountInfo extends StatelessWidget {
  ChangeAccountInfo({super.key});

  final TextEditingController userNameController =
      TextEditingController(text: 'Mohamed Tawfek');
  final TextEditingController phoneController =
      TextEditingController(text: '123456789');
  final TextEditingController ageController = TextEditingController(text: '21');

  @override
  Widget build(BuildContext context) {
    bool appMode=LanguagesAndModesCubit.get(context).isDark;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor:appMode?DarkColors.scaffoldColor: LightColors.scaffoldColor,
        systemOverlayStyle: SystemUiOverlayStyle(
         statusBarColor: appMode?DarkColors.scaffoldColor: LightColors.scaffoldColor
        ),
        title: Text('Sign up'.tr()),
        centerTitle: true,
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
              child: BlocProvider(
                create: (context) => AccountCubit(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocBuilder<AccountCubit, AccountState>(
                      builder: (context, state) {
                        AccountCubit cubit=AccountCubit.get(context);
                        return Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            AccountCubit.get(context).photo == null
                                ? const BuildDrawerImage(
                                    radius: 60,
                                    url:
                                        'https://media.licdn.com/dms/image/D4D03AQHXhxY0x4KXAQ/profile-displayphoto-shrink_800_800/0/1699261753374?e=1709769600&v=beta&t=4ZTxMXQx0vyxZAoGdB6GI8hCUMTr-_yC0gvT6kpO6Eo',
                                  )
                                : CircleAvatar(
                                    radius: 60,
                                    backgroundImage: FileImage(
                                        AccountCubit.get(context).photo!),
                                  ),
                            InkWell(
                              child:  CircleAvatar(
                                radius: 15,
                                backgroundColor:  appMode?DarkColors.buttonNavColor: LightColors.textColor
                        ,
                                child: Icon(
                                  Icons.edit,
                                  size: 20,
                                  color: appMode?DarkColors.textColor: LightColors.scaffoldColor,
                                ),
                              ),
                              onTap: () => _editPhoto(context,cubit),
                            )
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      height: context.deviceHeight * 0.05,
                    ),
                    CustomTextField(
                      controller: userNameController,
                      prefixIcon: const Icon(Icons.person),
                      hintText: 'New Username'.tr(),
                    ),
                    SizedBox(
                      height: context.deviceHeight * 0.05,
                    ),
                    CustomTextField(
                      controller: phoneController,
                      prefixIcon: const Icon(Icons.phone),
                      hintText: 'New Phone'.tr(),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: context.deviceHeight * 0.05,
                    ),
                    CustomTextField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      prefixIcon: const Icon(Icons.numbers),
                      hintText: 'New Age'.tr(),
                    ),
                    SizedBox(
                      height: context.deviceHeight * 0.05,
                    ),
                    GenderDropDownBtnField(isDark: false, value: "Male"),
                    SizedBox(
                      height: context.deviceHeight * 0.05,
                    ),
                    CustomBtn(
                      hasBackground: true,
                      onPressed:()=> _change(context),
                      textChild: 'Change'.tr(),
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

  void _editPhoto(BuildContext context,AccountCubit cubit) {
    bool appMode=LanguagesAndModesCubit.get(context).isDark;
    showModalBottomSheet(
        context: context,
        builder: (c) {
          return Container(
            height: context.deviceHeight * 0.1,
            color:  appMode?DarkColors.scaffoldColor: LightColors.scaffoldColor
            ,
            padding: EdgeInsetsDirectional.symmetric(
                vertical: context.deviceHeight * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  splashColor: Colors.transparent,

                  onTap:()=> _gallery(cubit,context),
                  child: Column(
                    children: [
                      Icon(
                        Icons.image,
                        color: appMode?DarkColors.textColor: LightColors.textColor,
                      ),
                      Text('Gallery'.tr(),
                      style: TextStyle(
                        color: appMode?DarkColors.textColor: LightColors.textColor
                      ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  onTap:()=> _camera(cubit,context),
                  child: Column(
                    children: [Icon(Icons.camera_alt,
                              color: appMode?DarkColors.textColor: LightColors.textColor
                      ,
                    ), Text('Camera'.tr(),
                      style: TextStyle(
                          color: appMode?DarkColors.textColor: LightColors.textColor
                      ),
                    )],
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _gallery(AccountCubit cubit,BuildContext context) {
    context.pop();
    cubit.uploadPhoto();
  }

  void _camera(AccountCubit cubit,BuildContext context) {
    context.pop();

    cubit.takePhoto();
  }

  void _change(BuildContext context) {
    context.pop();
  }
}
