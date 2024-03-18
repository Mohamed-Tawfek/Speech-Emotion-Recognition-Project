import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/core/constants/light_theme_colors.dart';

import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/helpers/cash_helper.dart';
import '../../../modes_controller/modes_cubit.dart';

class CodeScreen extends StatefulWidget {
 const CodeScreen({super.key});

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {

  String? qrData;
 late String userName ;
  late  String userImage ;
  late  String userEmail ;
  late  String token ;
  @override
  void initState() {
      userName = CashHelper.getData(key: 'userName');
      userImage = CashHelper.getData(key: 'userImage');
      userEmail = CashHelper.getData(key: 'userEmail');
      token = CashHelper.getData(key: 'token');

    Map j = {
      'userName': userName,
      'userImage': userImage,
      'userEmail': userEmail,
      'token': token,
    };
    qrData= jsonEncode(j);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool appMode = AppModeCubit.get(context).isDark;

    return Scaffold(
      backgroundColor: Color(0xfff7f8fa),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: context.deviceWidth * 0.1,
                vertical: context.deviceHeight * 0.05),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  userName ,
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                Text(
                  userEmail,
                  style: TextStyle(fontSize: 13.sp, color: Color(0xff6e7c85)),
                ),
                SizedBox(
                  height: context.deviceHeight * 0.025,
                ),
                QrImageView(
                  data: qrData??'',
                  version: QrVersions.auto,
                  size: context.deviceWidth * 0.45,
                  backgroundColor: appMode
                      ? DarkColors.qrCodeColor
                      : LightColors.qrCodeColor,
                   embeddedImage: const AssetImage('assets/icons/app_icon.png'),
                  // embeddedImageStyle: QrEmbeddedImageStyle(
                  //   size: Size(
                  //       context.deviceWidth * 0.2, context.deviceWidth * 0.2),
                  // ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: context.deviceWidth * 0.18,
                vertical: context.deviceHeight * 0.03),
            child: Text(
              'Your QR code is private. If you share it with someone,they can scan it with their SER camera to share your statistics',
              style: TextStyle(fontSize: 13.sp, color: Color(0xff6e7c85)),
            ),
          )
        ],
      )),
    );
  }
}
