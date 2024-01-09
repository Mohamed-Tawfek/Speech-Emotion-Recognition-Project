import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwitchLanguageWidget extends StatefulWidget {
  const SwitchLanguageWidget({super.key});

  @override
  State<SwitchLanguageWidget> createState() => _SwitchLanguageWidgetState();
}

class _SwitchLanguageWidgetState extends State<SwitchLanguageWidget> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        leading: Icon(
          Icons.language,
          size: 23.sp,
        ),
        iconColor: Colors.black,
        collapsedIconColor: Colors.black,
        title: Text(
          'Language',
          style: TextStyle(color: Colors.black, fontSize: 20.sp),
        ),
        children: const <Widget>[
          LanguagesRadios(),
        ],
      ),
    );
  }
}

enum Languages { English, Arabic }

class LanguagesRadios extends StatefulWidget {
  const LanguagesRadios({super.key});

  @override
  State<LanguagesRadios> createState() => _RadioListTileState();
}

class _RadioListTileState extends State<LanguagesRadios> {
  Languages _character = Languages.English;

  @override
  Widget build(BuildContext context) {
    double textRadiosSize = 15.sp;
    return Column(
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.black),
          child: RadioListTile<Languages>(
            activeColor: Colors.black,
            title: Text(
              'English',
              style: TextStyle(fontSize: textRadiosSize),
            ),
            value: Languages.English,
            groupValue: _character,
            onChanged: (Languages? value) {
              setState(() {
                _character = value!;
              });
            },
          ),
        ),
        RadioListTile<Languages>(
          activeColor: Colors.black,
          title: Text(
            'العربية',
            style: TextStyle(fontSize: textRadiosSize),
          ),
          value: Languages.Arabic,
          groupValue: _character,
          onChanged: (Languages? value) {
            setState(() {
              _character = value!;
            });
          },
        ),
      ],
    );
  }
}
