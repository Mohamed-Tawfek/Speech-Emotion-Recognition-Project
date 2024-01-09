import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return BlocProvider(
      create: (context) => SpeechCubit()..initRecorder(),
      child: BlocBuilder<SpeechCubit, SpeechState>(
        builder: (context, state) {
          SpeechCubit cubit = SpeechCubit.get(context);

          return Scaffold(
            drawer:cubit.recording?null: const DrawerSpeechScreen(),
            appBar: AppBar(
              leading:cubit.recording?const Text(''): Builder(
                builder: (context) => IconButton(
                  icon: Image.asset(
                    'assets/icons/menu.png',
                  ),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  cubit.recording
                      ? TopRecordingWidget(controller: controller)
                      : Text(
                          'Press on mic or import file to start',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                  SizedBox(
                    height: context.deviceHeight * 0.25,
                  ),
                  cubit.recording
                      ? const RecordingWidget()
                      : const NotRecordingWidget(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  State<TimerWidget> createState() => _TimerState();
}

class _TimerState extends State<TimerWidget>
    with SingleTickerProviderStateMixin {
  late final CustomTimerController _controller = CustomTimerController(
      vsync: this,
      begin: const Duration(seconds: 1),
      end: const Duration(days: 1),
      initialState: CustomTimerState.reset,
      interval: CustomTimerInterval.milliseconds);
  @override
  void initState() {
    _controller.start();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(
          horizontal: context.deviceWidth * 0.05,
          vertical: context.deviceHeight * 0.02),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffef6171),
              Color(0xffad3b89),
              Color(0xff24a0d6),
            ],
            stops: [.1, 0.4, 1.5],
          ),
          borderRadius: BorderRadius.circular(20)),
      child: CustomTimer(
          controller: _controller,
          builder: (state, time) {
            return Text("${time.hours}:${time.minutes}:${time.seconds}",
                style: TextStyle(fontSize: 20.0.sp, color: Colors.white));
          }),
    );
  }
}

class TopRecordingWidget extends StatelessWidget {
  const TopRecordingWidget({
    super.key,
    required this.controller,
  });

  final IOS7SiriWaveformController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TimerWidget(),
        SizedBox(
          height: context.deviceHeight * 0.12,
        ),
        SiriWaveform.ios7(
          controller: controller,
        ),
      ],
    );
  }
}

showResultBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (_) {
        return const AnalysisResultScreen();
      },
      isScrollControlled: true,
      barrierColor: const Color(0xffCA4B7F),
      useSafeArea: true);
}
