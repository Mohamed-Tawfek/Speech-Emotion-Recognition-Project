import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';

class AnalysisResultScreen extends StatelessWidget {
  const AnalysisResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Text(''),
        backgroundColor: const Color(0xffCA4B7F),
        title: const Text('Result',
        style: TextStyle(
          color: Colors.white
               ),

        ),
        centerTitle: true,
      ),
      body: Padding(
        padding:   EdgeInsetsDirectional.only(
          top: context.deviceHeight*0.05
        ),
        child: Column(
          children: [
            Center(
              child: Lottie.asset('assets/lotties/Happy.json',
              height: context.deviceHeight*0.4,
                width: context.deviceWidth*0.8

              ),
            ),
              Text('Happy',
            style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xffCA4B7F)
            ),

            ),
            const Spacer(),
            Container(

              margin: EdgeInsetsDirectional.only(

                bottom: context.deviceHeight*0.03,
                start: context.deviceWidth*0.1,
                end: context.deviceWidth*0.1,
              ),

              width: context.deviceWidth,
              child: MaterialButton(onPressed: (){
                context.pop();
              },

                color: const Color(0xffCA4B7F),
              child: Padding(
                 padding:EdgeInsetsDirectional.symmetric(
              vertical: context.deviceHeight*0.01,

              ),
                child: Text('Done',
                  style: TextStyle(
                      fontSize: 20.sp,
                      color:  Colors.white
                  ),

                ),
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
