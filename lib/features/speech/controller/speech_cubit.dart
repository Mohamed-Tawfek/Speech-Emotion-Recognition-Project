import 'dart:io';
import 'dart:math';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

import '../model/emotion_model.dart';
import '../screens/speech_screen.dart';
part 'speech_state.dart';

class SpeechCubit extends Cubit<SpeechState> {
  SpeechCubit() : super(SpeechInitial());
  static SpeechCubit get(context) => BlocProvider.of(context);
  late AudioRecorder record;
  String? path;
  bool recording = false;
  List<EmotionModel> emotions = [];
  void initEmotions(BuildContext context) {
    bool isEn = context.locale.languageCode == 'en';
    emotions = [
      EmotionModel(
          lottiePath: 'assets/lotties/emotions/Angery.json',
          name: 'Angry'.tr(),
          voiceOverPath: isEn
              ? 'assets/voice_over/en/angry.wav'
              : 'assets/voice_over/ar/angry.mp3'),
      EmotionModel(
          lottiePath: 'assets/lotties/emotions/Happy.json',
          name: 'Happy'.tr(),
          voiceOverPath: isEn
              ? 'assets/voice_over/en/happy.wav'
              : 'assets/voice_over/ar/happy.mp3'),
      EmotionModel(
          lottiePath: 'assets/lotties/emotions/Surprised.json',
          name: 'Surprised'.tr(),
          voiceOverPath: isEn
              ? 'assets/voice_over/en/surprised.wav'
              : 'assets/voice_over/ar/surprised.mp3'),
    ];
  }

  initRecorder() async {
    record = AudioRecorder();
    final Directory tempDir = await getApplicationDocumentsDirectory();
    path = tempDir.path;
    emit(InitRecordingState());
  }

  startRecording() async {
    recording = true;
    if (await record.hasPermission()) {
      if (path != null) {
        int number = Random().nextInt(100000000);
        path = '${path!}/$number.mp3';
        await record.start(const RecordConfig(), path: path!);
      }
    } else {
      print('Permission denied!');
    }
    emit(StartRecordingState());
  }

  doneRecording(context) async {
    recording = false;

    await record.stop();

    emit(StopRecordingState());
    ///////-------------------------//////
    List x = emotions;
    x.shuffle();
    ///////-------------------------//////

    showResultBottomSheet(context, x[0]);
    play(voicePath: x[0].voiceOverPath);
  }

  cancelRecording() async {
    await record.stop();
    recording = false;
    emit(CancelRecordingState());
    path = null;
    final Directory tempDir = await getApplicationDocumentsDirectory();
    path = tempDir.path;
  }

  play({required String voicePath}) async {

    //await player.play(DeviceFileSource(path!));

    // await player.play(AssetSource('assets/voices/surprised.mp3'));
    AssetsAudioPlayer.newPlayer().open(
      Audio(voicePath),
      autoStart: true,
      // showNotification: true,
    );

    path = null;
    final Directory tempDir = await getApplicationDocumentsDirectory();
    path = tempDir.path;
  }

  import(context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      path = file.path;

      showResultBottomSheet(context, emotions[0]);
      play(voicePath: emotions[0].voiceOverPath);
    } else {
      // User canceled the picker
    }
  }
}
