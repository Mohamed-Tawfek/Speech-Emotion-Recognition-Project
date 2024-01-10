import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';

class SwitchModeWidget extends StatelessWidget {
  const SwitchModeWidget({super.key,required this.color});
final  Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.symmetric(
          horizontal: context.deviceWidth * 0.01
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          iconColor: color,
          collapsedIconColor:color,
          leading: Icon(
            Icons.change_circle,
            size: 23.sp,
          ),
          title: Text(
            'Mode',
            style: TextStyle(color: color, fontSize: 20.sp),
          ),
          children: const <Widget>[
            ModesRadios(),
          ],
        ),
      ),
    );
  }
}

enum Modes { Dark, Light }

class ModesRadios extends StatefulWidget {
  const ModesRadios({super.key});

  @override
  State<ModesRadios> createState() => _ModesRadiosState();
}

class _ModesRadiosState extends State<ModesRadios> {
  Modes _character = Modes.Light;
  @override
  Widget build(BuildContext context) {
    double textRadiosSize = 15.sp;

    return Column(
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.black),
          child: RadioListTile<Modes>(
            activeColor: Colors.black,
            title: Text(
              'Light',
              style: TextStyle(fontSize: textRadiosSize),
            ),
            value: Modes.Light,
            groupValue: _character,
            onChanged: (Modes? value) {
              setState(() {
                _character = value!;
              });
            },
          ),
        ),
        RadioListTile<Modes>(
          activeColor: Colors.black,
          title: Text(
            'Dark',
            style: TextStyle(fontSize: textRadiosSize),
          ),
          value: Modes.Dark,
          groupValue: _character,
          onChanged: (Modes? value) {
            setState(() {
              _character = value!;
            });
          },
        ),
      ],
    );
  }
}
