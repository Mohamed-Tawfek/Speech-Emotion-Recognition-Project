import 'package:flutter/material.dart';
import 'package:speech_emotion_recognition_project/features/speech/widgets/speech_custom_btn.dart';

import '../../../modes_controller/modes_cubit.dart';
import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';
import '../controller/speech_cubit.dart';

class RecordingWidget extends StatelessWidget {
  const RecordingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final SpeechCubit cubit = SpeechCubit.get(context);
    bool appMode=AppModeCubit.get(context).isDark;

    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SpeechCustomBtn(
          onTap: () => _doneBtn(cubit,context),
          child:   Icon(
            Icons.done,
            size: 60,
            color:appMode?DarkColors.scaffoldColor: LightColors.scaffoldColor,
          ),
        ),
        SpeechCustomBtn(
          onTap: () => _cancelBtn(cubit),
          child:   Icon(
            Icons.clear,
            size: 60,
            color:appMode?DarkColors.scaffoldColor: LightColors.scaffoldColor,
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
