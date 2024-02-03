import 'package:dateofbirth/dateofbirth.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/features/account/controller/account/account_cubit.dart';
import 'package:speech_emotion_recognition_project/features/account/models/user_model.dart';

import '../../../core/components/custom_btn.dart';
import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';
import '../../../modes_controller/modes_cubit.dart';
import '../../authentication/widgets/custom_text_field.dart';
import '../../authentication/widgets/gender_drop_down_btn_field.dart';
import '../../speech/widgets/drawer_components.dart';
import '../controller/change_account_info/change_account_info_cubit.dart';

class ChangeAccountInfo extends StatefulWidget {
  ChangeAccountInfo({super.key});

  @override
  State<ChangeAccountInfo> createState() => _ChangeAccountInfoState();
}

class _ChangeAccountInfoState extends State<ChangeAccountInfo> {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  int selectedDay = 0;

  int selectedMonth = 0;

  int selectedYear = 0;

  @override
  Widget build(BuildContext widgetContext) {
    bool appMode = AppModeCubit.get(widgetContext).isDark;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor:
            appMode ? DarkColors.scaffoldColor : LightColors.scaffoldColor,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor:
                appMode ? DarkColors.scaffoldColor : LightColors.scaffoldColor),
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
                create: (context) => ChangeAccountInfoCubit()..getAccountInfo(),
                child:
                    BlocBuilder<ChangeAccountInfoCubit, ChangeAccountInfoState>(
                  builder: (context, state) {
                    ChangeAccountInfoCubit cubit =
                        ChangeAccountInfoCubit.get(context);

                    selectedDay =
                        cubit.userModel != null ? cubit.userModel!.day : 0;
                    selectedMonth =
                        cubit.userModel != null ? cubit.userModel!.month : 0;
                    selectedYear =
                        cubit.userModel != null ? cubit.userModel!.year : 0;
                    if ([
                      firstNameController.text.isEmpty,
                      lastNameController.text.isEmpty,
                      phoneController.text.isEmpty
                    ].contains(true)) {
                      if (cubit.userModel != null) {
                        firstNameController.text = cubit.userModel!.firstname;
                        lastNameController.text = cubit.userModel!.lastname;
                        phoneController.text =
                            cubit.userModel!.phone.toString();
                        chosenGenderValue = cubit.userModel!.gender;
                      }
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        cubit.userModel == null
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: appMode
                                      ? DarkColors.primary
                                      : LightColors.primary,
                                ),
                              )
                            : Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  ChangeAccountInfoCubit.get(context).photo ==
                                          null
                                      ? ChangeAccountInfoCubit.get(context)
                                                  .userModel!
                                                  .imgCover !=
                                              null
                                          ? BuildDrawerImage(
                                              radius: 60,
                                              url: ChangeAccountInfoCubit.get(
                                                      context)
                                                  .userModel!
                                                  .imgCover!,
                                            )
                                          : const NotFoundImageUser()
                                      : CircleAvatar(
                                          radius: 60,
                                          backgroundImage: FileImage(
                                              ChangeAccountInfoCubit.get(
                                                      context)
                                                  .photo!),
                                        ),
                                  InkWell(
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: appMode
                                          ? DarkColors.buttonNavColor
                                          : LightColors.textColor,
                                      child: Icon(
                                        Icons.edit,
                                        size: 20,
                                        color: appMode
                                            ? DarkColors.textColor
                                            : LightColors.scaffoldColor,
                                      ),
                                    ),
                                    onTap: () => _editPhoto(context, cubit),
                                  )
                                ],
                              ),
                        SizedBox(
                          height: context.deviceHeight * 0.05,
                        ),
                        CustomTextField(
                          controller: firstNameController,
                          prefixIcon: const Icon(Icons.person),
                          hintText: 'New first name'.tr(),
                        ),
                        SizedBox(
                          height: context.deviceHeight * 0.05,
                        ),
                        CustomTextField(
                          controller: lastNameController,
                          prefixIcon: const Icon(Icons.person),
                          hintText: 'New last name'.tr(),
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
                        GenderDropDownBtnField(isDark: false),
                        SizedBox(
                          height: context.deviceHeight * 0.03,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Enter new BirthDate:'.tr(),
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
                          onPressed: () => _change(context,
                               widgetContext: widgetContext,
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              selectedDay: selectedDay,
                              selectedMonth: selectedMonth,
                              selectedYear: selectedYear,
                              phone: phoneController.text),
                          textChild: 'Change'.tr(),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _editPhoto(BuildContext context, ChangeAccountInfoCubit cubit) {
    bool appMode = AppModeCubit.get(context).isDark;
    showModalBottomSheet(
        context: context,
        builder: (c) {
          return Container(
            height: context.deviceHeight * 0.1,
            color:
                appMode ? DarkColors.scaffoldColor : LightColors.scaffoldColor,
            padding: EdgeInsetsDirectional.symmetric(
                vertical: context.deviceHeight * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  onTap: () => _gallery(cubit, context),
                  child: Column(
                    children: [
                      Icon(
                        Icons.image,
                        color: appMode
                            ? DarkColors.textColor
                            : LightColors.textColor,
                      ),
                      Text(
                        'Gallery'.tr(),
                        style: TextStyle(
                            color: appMode
                                ? DarkColors.textColor
                                : LightColors.textColor),
                      )
                    ],
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  onTap: () => _camera(cubit, context),
                  child: Column(
                    children: [
                      Icon(
                        Icons.camera_alt,
                        color: appMode
                            ? DarkColors.textColor
                            : LightColors.textColor,
                      ),
                      Text(
                        'Camera'.tr(),
                        style: TextStyle(
                            color: appMode
                                ? DarkColors.textColor
                                : LightColors.textColor),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _gallery(ChangeAccountInfoCubit cubit, BuildContext context) {
    context.pop();
    cubit.uploadPhoto();
  }

  void _camera(ChangeAccountInfoCubit cubit, BuildContext context) {
    context.pop();

    cubit.takePhoto();
  }

  void _change(
    BuildContext context, {
      required widgetContext,
    required firstName,
    required lastName,
    required phone,
    required selectedDay,
    required selectedMonth,
    required selectedYear,
  }) {

    ChangeAccountInfoCubit.get(context).changeData(
      birthDate: "$selectedMonth/$selectedDay/$selectedYear",
      firstName: firstName,
      gender: chosenGenderValue!,
      lastName: lastName,
      phone: phone,
      context: widgetContext,
    );
  }
}
