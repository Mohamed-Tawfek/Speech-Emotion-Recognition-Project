import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwitchModeWidget extends StatelessWidget {
  const SwitchModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        iconColor: Colors.black,
        collapsedIconColor: Colors.black,
        leading: Icon(
          Icons.change_circle,
          size: 23.sp,
        ),
        title: Text(
          'Mode',
          style: TextStyle(color: Colors.black, fontSize: 20.sp),
        ),
        children: const <Widget>[
          ModesRadios(),
        ],
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
