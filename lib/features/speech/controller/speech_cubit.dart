import 'dart:io';
import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:speech_emotion_recognition_project/core/constants/api_constants.dart';
import 'package:speech_emotion_recognition_project/core/helpers/cash_helper.dart';
import 'package:speech_emotion_recognition_project/core/helpers/dio_helper.dart';

import '../../../core/components/custom_snackBar.dart';
import '../../../core/components/dialogs.dart';
import '../model/emotion_model.dart';
import '../model/result_model.dart';
import '../screens/speech_screen.dart';

part 'speech_state.dart';

class SpeechCubit extends Cubit<SpeechState> {
  SpeechCubit() : super(SpeechInitial());

  static SpeechCubit get(context) => BlocProvider.of(context);
  AnalysisResultModel? resultModel;
  int? emotionIndex;
  late AudioRecorder record;
  String? path;
  bool recording = false;
  List<EmotionModel> emotions = [];

  void initEmotions(BuildContext context) {
    emotions = [
      EmotionModel(
        lottiePath: 'assets/lotties/emotions/Angery.json',
        name: 'Angry',
        voiceOverPath: 'assets/voice_over/en/angry.wav',
        messages: [
          'Anger is a valid emotion. It’s only bad when it takes control and makes you do things you don’t want to do.” - Ellen Hopkins',
          'If you lose your temper, you will also lose some respect.” - Ron Baratono',
          'Anger does not solve anything; it builds nothing.” – Thomas S. Monson',
          'For every minute you remain angry, you give up sixty seconds of peace of mind.',
          'If you cannot stop yourself from getting angry, then at least get angry about things that matter.” – Amit Kalantri',
          'Fill your heart with kindness and forgiveness, there will be no stress, anger, or bitterness.” - Debasish Mridha',
          'Anger keeps us down and hinders us from moving forward.” – E’yen A. Gardner',
          'When you hold on to anger and unforgiveness, you can\'t move forward.',
          'The more anger towards the past you carry in your heart, the less capable you are of loving in the present',
          'Boredom, anger, sadness, or fear are not yours, not personal. They are conditions of the human mind. They come and go. Nothing that comes and goes is you',
          'Don’t let anger consume you'
        ],
      ),
      EmotionModel(
          lottiePath: 'assets/lotties/emotions/Happy.json',
          name: 'Happy',
          voiceOverPath: 'assets/voice_over/en/happy.wav',
          messages: [
            'You are worthy of everything in life, you deserve to be happy.',
            'Happiness is the only thing that multiplies when you share it',
            'Live life to the fullest and focus on the positive',
            'When you are enthusiastic about what you do, you feel this positive energy. It’s very simple.” - Paulo Coelho',
            'Dream as if you\'ll live forever, live as if you\'ll die today." - James Dean',
            'Be happy with what you have. Be excited about what you want." Alan Cohen',
            'Gratitude unlocks the fullness of life. It turns what we have into enough, and more. It turns denial into acceptance, chaos to order, confusion to clarity. It can turn a meal into a feast, a house into a home, a stranger into a friend. Gratitude makes sense of our past, brings peace for today, and creates a vision for tomorrow." Melody Beattie'
          ]),
      EmotionModel(
          lottiePath: 'assets/lotties/emotions/Surprised.json',
          name: 'Surprised',
          voiceOverPath: 'assets/voice_over/en/surprised.wav',
          messages: [
            'Surprise (the good kind!): A sense of delight when someone brings you unexpected happiness or a situation goes even better than you had hoped. A sense of delight when someone brings you unexpected happiness or a situation goes even better than you had hoped.',
            'Life is full of surprises',
            'The unexpected moments are always sweeter.',
          ]),
      EmotionModel(
          lottiePath: 'assets/lotties/emotions/calm.json',
          name: 'Calm',
          voiceOverPath: 'assets/voice_over/en/calm.wav',
          messages: [
            'good things start with believing that you can do it',
            'I hope you know how brave, important, sparkling, and wonderful you are, even if you don\'t feel like it',
            'You don\'t have to run, but don\'t stop',
            'There\'s no failure. You either win or you learn',
            'I hope you\'re getting enough sleep, eating well, and taking care of yourself.',
            'Take it day by day, don\'t stress too much about tomorrow'
          ]),
      EmotionModel(
          lottiePath: 'assets/lotties/emotions/disgust.json',
          name: 'Disgusted',
          voiceOverPath: 'assets/voice_over/en/disgusted.wav',
          messages: [
            'Instead of resisting any emotion, the best way to dispel it is to enter it fully, embrace it and see through your resistance'
          ]),
      EmotionModel(
          lottiePath: 'assets/lotties/emotions/fear.json',
          name: 'Fear',
          voiceOverPath: 'assets/voice_over/en/fear.wav',
          messages: [
            'It\'s completely okay to feel these feelings, and it\'s okay to be scared',
            '“The enemy is fear. We think it is hate, but it is fear.” – Gandhi',
            '"Fear is a reaction. Courage is a decision.” -Sir Winston Churchill',
            'If it scares you, it\'s a sign you need to do it.',
            'Don\'t let your fear of what could happen, make nothing happen',
            'Fear is temporary. Regret is forever, Feel the fear and do it anyway',
            'Life begins where fear ends',
            '“Thinking will not overcome fear, but action will.” -W. Clement Stone'
          ]),
      EmotionModel(
          lottiePath: 'assets/lotties/emotions/Neutral.json',
          name: 'Natural',
          voiceOverPath: 'assets/voice_over/en/natural.wav',
          messages: [
            'What is coming is better than what is gone',
            'don\'t give up everything take time'
                'I hope you know how brave, important, sparkling, and wonderful you are, even if you don\'t feel like it'
                'You don\'t have to run, but don\'t stop'
                'There\'s no failure. You either win or you learn'
                'I hope you\'re getting enough sleep, eating well, and taking care of yourself.',
            'Take it day by day, don\'t stress too much about tomorrow'
                'It\'s okay if things once felt easy now feel difficult'
          ]),
      EmotionModel(
          lottiePath: 'assets/lotties/emotions/Sad.json',
          name: 'Sad',
          voiceOverPath: 'assets/voice_over/en/sad.wav',
          messages: [
            'don\'t quit yet, the worst moments are usually followed by the most beautiful silver lining',
            'You must stay strong, remember to keep your head up and remain hopeful',
            'I hope you know how brave, important, sparkling, and wonderful you are, even if you don\'t feel like it',
            'the dark days are not here to stay, they are here to help you grow Up.',
            'It\'s okay to feel sad again about things you thought you\'d moved on from',
            'Once you replace negative thoughts with positive ones, you’ll start having positive results'
          ]),
    ];
  }

  initRecorder() async {
    record = AudioRecorder();

    final Directory tempDir = await getTemporaryDirectory();
    path = tempDir.path;
    emit(InitRecordingState());
  }

  startRecording(context) async {
    recording = true;
    if (await record.hasPermission()) {
      if (path != null) {
        int number = Random().nextInt(100000000);
        path = '${path!}/$number.mp3';
        await record.start(const RecordConfig(encoder: AudioEncoder.wav),
            path: path!);
      }
    } else {
      showCustomSnackBar(context, 'Permission to access mic denied!');
    }
    emit(StartRecordingState());
  }

  doneRecording(context) async {
    recording = false;

    emit(StopRecordingState());
    await record.stop();

    await sendAudio(context: context, path: path!).then((value) {
      if (resultModel != null) {
        showResultBottomSheet(context, emotions[emotionIndex!]);
        play(voicePath: emotions[emotionIndex!].voiceOverPath);
      } else {
        showResultBottomSheet(
            context,
            EmotionModel(
                messages: [],
                name: 'Not Recognized!',
                lottiePath: 'assets/lotties/emotions/unkown.json',
                voiceOverPath: 'assets/voice_over/en/not recognized.wav'));
        play(voicePath: 'assets/voice_over/en/not recognized.wav');
      }
    });

    path = null;
    final Directory tempDir = await getTemporaryDirectory();
    path = tempDir.path;
  }

  cancelRecording() async {
    await record.stop();
    recording = false;
    emit(CancelRecordingState());
    path = null;
    final Directory tempDir = await getTemporaryDirectory();
    path = tempDir.path;
  }

  import(context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);

      await sendAudio(context: context, path: file.path).then((value) {
        if (resultModel != null) {
          showResultBottomSheet(context, emotions[emotionIndex!]);
          play(voicePath: emotions[emotionIndex!].voiceOverPath);
        } else {
          showResultBottomSheet(
              context,
              EmotionModel(
                  messages: [],
                  name: 'Not Recognized!',
                  lottiePath: 'assets/lotties/emotions/unkown.json',
                  voiceOverPath: 'assets/voice_over/en/not recognized.wav'));
          play(voicePath: 'assets/voice_over/en/not recognized.wav');
        }
      });
    } else {
      showCustomSnackBar(context, 'No file selected!, try again');
    }
  }

  Future sendAudio(
      {required String path, required BuildContext context}) async {
    showLoadingDialog(context);
    resultModel = null;
    emotionIndex = null;
    emit(SendAudioLoadingState());

    var data = FormData.fromMap({
      'file': [await MultipartFile.fromFile(path, filename: path)],
    });

    await Dio()
        .post(
      ApiConstants.enterRecordEndPoint,
      data: data,
    )
        .then((value) {
      if (value.statusCode == 200) {
        emit(SendAudioSuccessState());
        resultModel = AnalysisResultModel.fromJson(value.data);
        emotionIndex = getEmotionIndex(emotion: resultModel!.result!);
        Navigator.pop(context);
        DioHelper.post(url: ApiConstants.enterEmotionEndPoint, headers: {
          'token': CashHelper.getData(key: 'token')
        }, data: {
          "emotion": value.data['result'].toString().toLowerCase(),
          "userId": CashHelper.getData(key: 'userID')
        });
      } else {
        emit(SendAudioErrorState());
        Navigator.pop(context);
      }
    }).catchError((error) {
      emit(SendAudioErrorState());
      Navigator.pop(context);
    });
  }

  getEmotionIndex({required String emotion}) {
    if (emotion == 'Angry') {
      return 0;
    } else if (emotion == 'Happy') {
      return 1;
    } else if (emotion == 'Surprised') {
      return 2;
    } else if (emotion == 'Calm') {
      return 3;
    } else if (emotion == 'Disgusted') {
      return 4;
    } else if (emotion == 'Fear') {
      return 5;
    } else if (emotion == 'Natural') {
      return 6;
    } else {
      return 7;
    }
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
    final Directory tempDir = await getTemporaryDirectory();
    path = tempDir.path;
  }
}
