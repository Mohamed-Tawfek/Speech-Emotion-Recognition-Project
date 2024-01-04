import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import '../../speech/widgets/drawer_components.dart';
import '../widgets/info_widget.dart';
import '../widgets/setting_action_btn.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(202, 75, 127, 1),
        // backgroundColor: const Color(0xffd8135a),
        title: const Text(
          'Account',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            color: const Color.fromRGBO(202, 75, 127, 1),
            child: SizedBox(
              width: context.deviceWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      BuildDrawerImage(
                        url:
                            'https://media.licdn.com/dms/image/D4D03AQHXhxY0x4KXAQ/profile-displayphoto-shrink_800_800/0/1699261753374?e=1709769600&v=beta&t=4ZTxMXQx0vyxZAoGdB6GI8hCUMTr-_yC0gvT6kpO6Eo',
                      ),
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.black54,
                        child: Icon(
                          Icons.camera_alt,
                          size: 20,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
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
          const SettingsOptions(
            date: '20/4/2002',
            gender: 'Male',
            phone: '0123456789',
          ),
        ],
      ),
    );
  }
}

class SettingsOptions extends StatelessWidget {
  const SettingsOptions(
      {super.key,
      required this.date,
      required this.phone,
      required this.gender});
  final String phone;
  final String gender;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.deviceHeight * 0.65,
      padding: EdgeInsetsDirectional.symmetric(
          horizontal: context.deviceWidth * 0.03,
          vertical: context.deviceHeight * 0.04),
      decoration: const BoxDecoration(
        color: Color(0xfff9f8fe),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            InfoWidget(
              date: date,
              gender: gender,
              phone: phone,
            ),
            SizedBox(
              height: context.deviceHeight * 0.03,
            ),
            SettingActionBtn(
                text: 'Change account info',
                icon: Icons.change_circle,
                onTap: _changeAccountInfo),
            SizedBox(
              height: context.deviceHeight * 0.03,
            ),
            SettingActionBtn(
                text: 'Change password',
                icon: Icons.lock,
                onTap: _changePasswordBtn),
            SizedBox(
              height: context.deviceHeight * 0.03,
            ),
            SettingActionBtn(
                text: 'Delete my account',
                icon: Icons.delete,
                color: Colors.red,
                onTap: _deleteAccountBtn),
          ],
        ),
      ),
    );
  }

  _deleteAccountBtn() {}

  _changePasswordBtn() {}

  _changeAccountInfo() {}
}
