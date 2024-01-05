import 'package:flutter/material.dart';
import 'package:speech_emotion_recognition_project/features/speech/widgets/speech_custom_btn.dart';

import '../controller/speech_cubit.dart';

class NotRecordingWidget extends StatelessWidget {
  const NotRecordingWidget ({super.key});

  @override
  Widget build(BuildContext context) {
    final SpeechCubit cubit = SpeechCubit.get(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SpeechCustomBtn(
          onTap: () => _micBtn(cubit),
          child: Image.asset(
            'assets/icons/mic.png',
            height: 60,
            width: 60,
          ),
        ),
        SpeechCustomBtn(
          onTap: ()=>_importBtn(cubit),
          child: Image.asset(
            'assets/icons/up-loading.png',
            height: 60,
            width: 60,
          ),
        ),
      ],
    );
  }
  void _micBtn(SpeechCubit cubit) async {
    cubit.startRecording();
  }
  void _importBtn(SpeechCubit cubit) {
    cubit.import();
  }
}
