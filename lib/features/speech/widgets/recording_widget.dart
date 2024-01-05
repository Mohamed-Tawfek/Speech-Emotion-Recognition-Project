import 'package:flutter/material.dart';
import 'package:speech_emotion_recognition_project/features/speech/widgets/speech_custom_btn.dart';

import '../controller/speech_cubit.dart';

class RecordingWidget extends StatelessWidget {
  const RecordingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final SpeechCubit cubit = SpeechCubit.get(context);

    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SpeechCustomBtn(
          onTap: () => _doneBtn(cubit,context),
          child: const Icon(
            Icons.done,
            size: 60,
            color: Colors.white,
          ),
        ),
        SpeechCustomBtn(
          onTap: () => _cancelBtn(cubit),
          child: const Icon(
            Icons.highlight_remove_outlined,
            size: 60,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
  void _cancelBtn(SpeechCubit cubit) {
    cubit.cancelRecording();
  }

  void _doneBtn(SpeechCubit cubit,context) async {
    cubit.doneRecording(context);
  }
}
