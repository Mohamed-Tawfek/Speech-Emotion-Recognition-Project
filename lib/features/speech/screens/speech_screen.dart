import 'package:custom_timer/custom_timer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/features/speech/controller/speech_cubit.dart';
import 'package:speech_emotion_recognition_project/features/speech/screens/analysis_result_screen.dart';
import '../../../Languages_and_modes_controller/mode_scubit_cubit.dart';
import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';
import '../widgets/drawer_of_speech.dart';
import '../widgets/not_recording_widget.dart';
import '../widgets/recording_widget.dart';

class SpeechScreen extends StatelessWidget {
  const SpeechScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppModeCubit, AppModeState>(
      builder: (context, state) {
        return BlocProvider(
          create: (context) => SpeechCubit()..initRecorder(),
          child: BlocBuilder<SpeechCubit, SpeechState>(
            builder: (context, state) {
              SpeechCubit cubit = SpeechCubit.get(context);
              bool appMode = AppModeCubit.get(context).isDark;
              return Scaffold(
                drawer: cubit.recording ? null : const DrawerSpeechScreen(),
                appBar: AppBar(
                  leading: cubit.recording
                      ? const Text('')
                      : Builder(
                          builder: (context) => IconButton(
                            icon: Image.asset(
                              'assets/icons/menu.png',
                            ),
                            onPressed: () => Scaffold.of(context).openDrawer(),
                          ),
                        ),
                ),
                body: SizedBox(
                  height: context.deviceHeight,
                  width: context.deviceWidth,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                        bottom: context.deviceHeight * 0.09),
                    child: Column(
                      children: [
                        cubit.recording
                            ? const TopRecordingWidget()
                            : Padding(
                                padding: EdgeInsetsDirectional.only(
                                    top: context.deviceHeight * 0.15),
                                child: Text(
                                  'Press on mic or import file to start'.tr(),
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: appMode
                                          ? DarkColors.textColor
                                          : LightColors.textColor),
                                ),
                              ),
                        const Spacer(),
                        cubit.recording
                            ? const RecordingWidget()
                            : const NotRecordingWidget(),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
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
    bool appMode = AppModeCubit.get(context).isDark;

    return Container(
      padding: EdgeInsetsDirectional.symmetric(
          horizontal: context.deviceWidth * 0.05,
          vertical: context.deviceHeight * 0.02),
      decoration: BoxDecoration(
          // gradient: const LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: [
          //     Color(0xffef6171),
          //     Color(0xffad3b89),
          //     Color(0xff24a0d6),
          //   ],
          //   stops: [.1, 0.4, 1.5],
          // ),
          color: appMode ? DarkColors.primary : LightColors.primary,
          borderRadius: BorderRadius.circular(20)),
      child: CustomTimer(
          controller: _controller,
          builder: (state, time) {
            return Text("${time.hours}:${time.minutes}:${time.seconds}",
                style: TextStyle(
                    fontSize: 20.0.sp,
                    color: appMode
                        ? DarkColors.scaffoldColor
                        : LightColors.scaffoldColor));
          }),
    );
  }
}

class TopRecordingWidget extends StatelessWidget {
  const TopRecordingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const TimerWidget(),
          SizedBox(
            height: context.deviceHeight * 0.12,
          ),
          Lottie.asset(
            'assets/lotties/listing.json',
            fit: BoxFit.cover,
            height: context.deviceHeight * 0.4,
            width: context.deviceWidth * 0.8,
          ),
        ],
      ),
    );
  }
}

showResultBottomSheet(context) {
  bool appMode = AppModeCubit.get(context).isDark;

  showModalBottomSheet(
      context: context,
      builder: (_) {
        return const AnalysisResultScreen();
      },
      isScrollControlled: true,
      barrierColor: appMode ? DarkColors.primary : LightColors.primary,
      useSafeArea: true);
}
