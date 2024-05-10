 import 'package:flutter/material.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
 import '../../../core/constants/dark_theme_colors.dart';
import '../../../modes_controller/modes_cubit.dart';
import 'info_item_widget.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key,required this.gender,required this.birthdate,required this.phone});
  final String phone;
  final String gender;
  final String birthdate;

  @override
  Widget build(BuildContext context) {
    bool appMode=AppModeCubit.get(context).isDark;
    return Container(
      decoration: BoxDecoration(
          color: appMode?DarkColors.buttonNavColor:Colors.grey[100],
          borderRadius: BorderRadius.circular(20)),
      width: context.deviceWidth,
      padding: EdgeInsetsDirectional.symmetric(
          horizontal: context.deviceWidth * 0.04,
          vertical: context.deviceHeight * 0.01),
      child: Column(
        children: [
          InfoItem(
            attribute: 'phone',
            value: phone,
          ),
          _divider(context.deviceHeight),
          InfoItem(
            attribute: 'BirthDate',
            value: birthdate,
          ),
          _divider(context.deviceHeight),
          InfoItem(
            attribute: 'Gender',
            value: gender,
          ),
        ],
      ),
    );
  }
  Widget _divider(deviceHeight) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(vertical: deviceHeight * 0.01),
      child: Container(
        height: 1,
        width: double.infinity,
        color: Colors.black26,
      ),
    );
  }

}
