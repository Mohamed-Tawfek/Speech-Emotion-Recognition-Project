import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siri_wave/siri_wave.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/features/speech/controller/speech_cubit.dart';
import 'package:speech_emotion_recognition_project/features/speech/screens/analysis_result_screen.dart';

import '../widgets/drawer_of_speech.dart';
import '../widgets/not_recording_widget.dart';
import '../widgets/recording_widget.dart';

class SpeechScreen extends StatelessWidget {
  SpeechScreen({super.key});

  final controller = IOS7SiriWaveformController(
    amplitude: 0.5,
    color: const Color.fromRGBO(229, 66, 108, 0.75),
    frequency: 5,
    speed: 0.15,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerSpeechScreen(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Image.asset(
              'assets/icons/menu.png',
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: Center(
        child: BlocProvider(
          create: (context) => SpeechCubit()..initRecorder(),
          child: BlocBuilder<SpeechCubit, SpeechState>(
            builder: (context, state) {
              SpeechCubit cubit = SpeechCubit.get(context);

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  cubit.recording
                      ? SiriWaveform.ios7(
                          controller: controller,
                        )
                      : const Text('Press on mic or import file to start'),
                  SizedBox(
                    height: context.deviceHeight * 0.3,
                  ),
                  cubit.recording
                      ? const RecordingWidget()
                      : const NotRecordingWidget(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

showResultBottomSheet(context) {
  showModalBottomSheet
    (
      context: context,
      builder: (_) {
        return const AnalysisResultScreen();
      },
      isScrollControlled: true,
      barrierColor: const Color(0xffCA4B7F),
      useSafeArea: true);
}
