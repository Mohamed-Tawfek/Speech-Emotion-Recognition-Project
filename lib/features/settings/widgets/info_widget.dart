import 'package:flutter/material.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';

import 'info_item_widget.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key,required this.gender,required this.date,required this.phone});
  final String phone;
  final String gender;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
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
            attribute: 'Date of birth',
            value: date,
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
