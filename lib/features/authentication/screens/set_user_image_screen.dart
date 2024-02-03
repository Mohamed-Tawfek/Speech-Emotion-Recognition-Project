import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import '../../../modes_controller/modes_cubit.dart';
import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';
import '../controllers/signup/signup_cubit.dart';


class SetUserImageScreen extends StatelessWidget {
  SetUserImageScreen(
      {super.key,
      required this.birthDate,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.gender,
      required this.password,
      required this.phone});
  String email;
  String password;
  String firstName;
  String lastName;
  String phone;
  String gender;
  String birthDate;

  @override
  Widget build(BuildContext context) {
    bool appMode = AppModeCubit.get(context).isDark;
    return Scaffold(
      appBar: AppBar(
        title: Text('User image setup'.tr()),
      ),
      body: SizedBox(
        width: context.deviceWidth,
        height: context.deviceHeight,
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
              horizontal: context.deviceWidth * 0.07,
              vertical: context.deviceHeight * 0.04),
          child: BlocProvider(
            create: (context) => SignUpCubit(),
            child: BlocBuilder<SignUpCubit, SignUpState>(
              builder: (context, state) {
                SignUpCubit cubit = SignUpCubit.get(context);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    cubit.photo == null
                        ? CircleAvatar(
                            radius: 100.sp,
                            backgroundColor: Colors.grey[300],
                            child: Image.asset(
                              'assets/icons/user.png',
                            ),
                          )
                        : CircleAvatar(
                            radius: 100.sp,
                            backgroundImage: FileImage(cubit.photo!),
                          ),
                    SizedBox(
                      height: context.deviceHeight * 0.1,
                    ),
                    TextButton(
                        style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent)),
                        onPressed: () => _uploadImage(cubit),
                        child: Text(
                          'Upload a photo'.tr(),
                          style: TextStyle(
                              fontSize: 20.sp, color: const Color(0xffCA4B7F)),
                        )),
                    SizedBox(
                      height: context.deviceHeight * 0.02,
                    ),
                    TextButton(
                        style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent)),
                        onPressed: () => _takePhoto(cubit),
                        child: Text(
                          'Take a photo'.tr(),
                          style: TextStyle(
                              fontSize: 20.sp, color: const Color(0xffCA4B7F)),
                        )),
                    const Spacer(),
                    Container(
                      height: context.deviceHeight * 0.08,
                      width: context.deviceWidth,
                      decoration: BoxDecoration(
                          color: const Color(0xffCA4B7F),
                          borderRadius: BorderRadius.circular(30)),
                      child: MaterialButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () => _finish(context),
                        child: Text(
                          'Finish'.tr(),
                          style: TextStyle(
                              color: appMode
                                  ? DarkColors.scaffoldColor
                                  : LightColors.scaffoldColor,
                              fontSize: 18.sp),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _finish(BuildContext context) async{
     SignUpCubit.get(context)
        .signUp(
            birthDate: birthDate,
            email: email,
            firstName: firstName,
            lastName: lastName,
            gender: gender,
            password: password,
            phone: phone,
     context: context)
      ;
  }

  void _takePhoto(SignUpCubit cubit) {
    cubit.takePhoto();
  }

  void _uploadImage(SignUpCubit cubit) {
    cubit.uploadPhoto();
  }
}
