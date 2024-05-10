import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_emotion_recognition_project/features/speech/widgets/speech_custom_btn.dart';

import '../../../modes_controller/modes_cubit.dart';
import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';
import '../controller/speech_cubit.dart';

class NotRecordingWidget extends StatelessWidget {
  const NotRecordingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppModeCubit, AppModeState>(
      builder: (context, state) {
        final SpeechCubit cubit = SpeechCubit.get(context);
        bool appMode = AppModeCubit.get(context).isDark;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SpeechCustomBtn(
              onTap: () => _micBtn(cubit,context),
              child: Icon(
                Icons.mic,
                size: 60,
                color: appMode
                    ? DarkColors.scaffoldColor
                    : LightColors.scaffoldColor,
              ),
            ),
            SpeechCustomBtn(
              onTap: () => _importBtn(cubit, context),
              child: Icon(
                Icons.file_upload_rounded,
                size: 60,
                color: appMode
                    ? DarkColors.scaffoldColor
                    : LightColors.scaffoldColor,
              ),
            ),
          ],
        );
      },
    );
  }

  void _micBtn(SpeechCubit cubit,context) async {
    cubit.startRecording(context);
  }

  void _importBtn(SpeechCubit cubit, BuildContext context) {
    cubit.import(context);
  }
}
