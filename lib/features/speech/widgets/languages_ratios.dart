import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
class SwitchLanguageWidget extends StatelessWidget {
  const SwitchLanguageWidget({super.key,required this.color});
  final  Color color;

  @override
     Widget build(BuildContext context) {
      return Padding(
        padding:  EdgeInsetsDirectional.symmetric(
            horizontal: context.deviceWidth * 0.01
        ),      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: Icon(
            Icons.language,
            size: 23.sp,
          ),
          iconColor: color,
          collapsedIconColor: color,

          title: Text(
            'Language',
            style: TextStyle(color: color, fontSize: 20.sp),
          ),
          children:   <Widget>[
            LanguagesRadios(color: color),
          ],
        ),
      ),
      );
    }

}



enum Languages { English, Arabic }

class LanguagesRadios extends StatefulWidget {
  const LanguagesRadios({super.key,required this.color});
  final  Color color;

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
          data: Theme.of(context).copyWith(dividerColor: widget.color),
          child: RadioListTile<Languages>(
            activeColor: widget.color,
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
          activeColor: widget.color,
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
