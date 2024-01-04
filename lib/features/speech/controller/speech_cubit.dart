import 'dart:io';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
part 'speech_state.dart';

class SpeechCubit extends Cubit<SpeechState> {
  SpeechCubit() : super(SpeechInitial());
  static SpeechCubit get(context) => BlocProvider.of(context);
  late AudioRecorder record;
  String? path;
  bool recording = false;

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

  doneRecording() async {
    recording = false;

    await record.stop();

    emit(StopRecordingState());
    play();
  }

  cancelRecording() async {
    await record.stop();
    recording = false;
    emit(CancelRecordingState());
    path = null;
    final Directory tempDir = await getApplicationDocumentsDirectory();
    path = tempDir.path;
  }

  play({String? path1}) async {
    final player = AudioPlayer();
    await player.play(DeviceFileSource(path!));
    path = null;
    final Directory tempDir = await getApplicationDocumentsDirectory();
    path = tempDir.path;
  }

  import() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      path = file.path;
      play();
    } else {
      // User canceled the picker
    }
  }
}
