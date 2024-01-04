import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({super.key, required this.value, required this.attribute});

  final String attribute;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          attribute,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(fontSize: 15.sp, color: Colors.grey),
        )
      ],
    );
  }
}
