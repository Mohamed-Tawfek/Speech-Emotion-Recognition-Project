import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/core/constants/dark_theme_colors.dart';
import 'package:speech_emotion_recognition_project/core/constants/light_theme_colors.dart';

import '../../../core/helpers/cash_helper.dart';
import '../../../modes_controller/modes_cubit.dart';

class CodeScreen extends StatefulWidget {
  const CodeScreen({super.key});

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  String? qrData;
  late String userName;
  late String userImage;
  late String userEmail;
  late String token;
  late String userID;
  @override
  void initState() {
    userName = CashHelper.getData(key: 'userName');
    userImage = CashHelper.getData(key: 'userImage');
    userEmail = CashHelper.getData(key: 'userEmail');
    token = CashHelper.getData(key: 'token');
    userID = CashHelper.getData(key: 'userID');

    Map j = {
      'userName': userName,
      'userImage': userImage,
      'userEmail': userEmail,
      'token': token,
      'userID':userID
    };
    qrData = jsonEncode(j);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool appMode = AppModeCubit.get(context).isDark;

    return Scaffold(
      backgroundColor: appMode?DarkColors.scaffoldSharingFeatureColor:LightColors.scaffoldSharingFeatureColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color:appMode?DarkColors.scaffoldColor :LightColors.scaffoldColor,
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: context.deviceWidth * 0.1,
                vertical: context.deviceHeight * 0.05),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  userName,
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold,color: appMode?DarkColors.textColor :LightColors.textColor),
                ),
                Text(
                  userEmail,
                  style: TextStyle(
                      fontSize: 13.sp, color: const Color(0xff6e7c85)),
                ),
                SizedBox(
                  height: context.deviceHeight * 0.025,
                ),
                SizedBox(

                  width: context.deviceWidth * 0.45,
                  height: context.deviceWidth * 0.45,
                  child: PrettyQrView.data(

                    data: qrData ?? '',
                    decoration:   PrettyQrDecoration(

                    //  background:appMode?DarkColors.scaffoldColor :LightColors.textColor ,

                        image:const PrettyQrDecorationImage(

                          image: AssetImage('assets/icons/app_icon.png'),
                        ),
                       shape: PrettyQrSmoothSymbol()

                    ),
                  ),
                ),

              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: context.deviceWidth * 0.18,
                vertical: context.deviceHeight * 0.03),
            child: Text(
              'Your QR code is private. If you share it with someone,they can scan it with their SER camera to share your statistics'
                  .tr(),
              style: TextStyle(fontSize: 13.sp, color: const Color(0xff6e7c85)),
            ),
          )
        ],
      )),
    );
  }
}
