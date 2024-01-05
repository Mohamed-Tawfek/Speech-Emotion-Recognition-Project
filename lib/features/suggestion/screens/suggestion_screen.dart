import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/features/suggestion/screens/thanks_screen.dart';

class SuggestionScreen extends StatelessWidget {
  const SuggestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: context.deviceHeight,
        padding: EdgeInsetsDirectional.symmetric(
            horizontal: context.deviceWidth * 0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: TextFormField(
                maxLength: 100,
                maxLines: 10,
                decoration:   InputDecoration(

                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
              ),
            ),
            SizedBox(
              height: context.deviceHeight * 0.05,
            ),
            Container(
              margin: EdgeInsetsDirectional.only(
                bottom: context.deviceHeight * 0.03,
                start: context.deviceWidth * 0.1,
                end: context.deviceWidth * 0.1,
              ),
              width: context.deviceWidth,
              child: MaterialButton(
                onPressed:()=> _sendBtn(context),
                color: const Color(0xffCA4B7F),
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                    vertical: context.deviceHeight * 0.01,
                  ),
                  child: Text(
                    'Send',
                    style: TextStyle(fontSize: 20.sp, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _sendBtn(context) {
    showThanksBottomSheet(context);

  }
  showThanksBottomSheet(context) {
    showModalBottomSheet
      (
        context: context,
        builder: (_) {
          return const ThanksScreen();
        },
        isScrollControlled: true,
        barrierColor: const Color(0xffCA4B7F),
        useSafeArea: true);
  }

}
