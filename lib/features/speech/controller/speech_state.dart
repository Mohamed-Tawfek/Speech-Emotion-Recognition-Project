part of 'speech_cubit.dart';


abstract class SpeechState {}

class SpeechInitial extends SpeechState {}
class StartRecordingState extends SpeechState {}
class InitRecordingState extends SpeechState {}
class StopRecordingState extends SpeechState {}
class CancelRecordingState extends SpeechState {}
class SendAudioLoadingState extends SpeechState {}
class SendAudioSuccessState extends SpeechState {}
class SendAudioErrorState extends SpeechState {}




