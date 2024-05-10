import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speech_emotion_recognition_project/core/components/dialogs.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/core/components/toast.dart';
import 'package:speech_emotion_recognition_project/core/constants/api_constants.dart';
import 'package:speech_emotion_recognition_project/core/helpers/dio_helper.dart';
import 'package:speech_emotion_recognition_project/features/authentication/screens/email_send_screen.dart';

import '../../models/signup_model.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  static SignUpCubit get(context) => BlocProvider.of(context);
  final ImagePicker _picker = ImagePicker();
  File? photo;
  SignUpModel? signUpModel;
  Future<void> takePhoto() async {
    final XFile? result = await _picker.pickImage(source: ImageSource.camera);
    if (result != null) {
      photo = File(result.path);
      emit(TakenPhotoState());
    }
  }

  Future<void> uploadPhoto() async {
    final XFile? result = await _picker.pickImage(source: ImageSource.gallery);
    if (result != null) {
      photo = File(result.path);

      emit(TakenPhotoState());
    }
  }

  Future<void> signUp(
      {required birthDate,
      required email,
      required firstName,
      required lastName,
      required gender,
      required password,
      required phone,
      required BuildContext context}) async {
    showLoadingDialog(context);
    signUpModel = null;

    var formData =photo!=null? FormData.fromMap({
      'image': [
        await MultipartFile.fromFile(photo!.path, filename:photo!.path)
      ],
      'firstname':firstName,
      'lastname': lastName,
      'gender': gender,
      'birthday': birthDate,
      'email': email,
      'phone': phone,
      'password': password
    }):FormData.fromMap({

      'firstname':firstName,
      'lastname': lastName,
      'gender': gender,
      'birthday': birthDate,
      'email': email,
      'phone': phone,
      'password': password
    });
    DioHelper.post(url: ApiConstants.signupEndPoint, data: formData)
        .then((Response response) {
      Navigator.pop(context);
      signUpModel = SignUpModel.fromJson(response.data);

      if (response.statusCode == 200) {
        context.pushAndRemoveUntil(SendEmailScreen(
          forConfirm: true,
          email: email,
        ));
      } else {
        showToast(context, signUpModel!.message!);
        context.pop();
      }
    }).catchError((error){
      print('-'*20);
       print(error);
      print('-'*20);

    });





  }
}

// Future uploadImage(File file) async {
//   String fileName = file.path.split('/').last;
//   FormData formData = FormData.fromMap({
//     "image": await MultipartFile.fromFile(file.path, filename: fileName),
//     "firstname": "",
//     "lastname": "",
//     "gender": "",
//     "birthday": "",
//     "email": "",
//     "phone": "",
//     "password": "",
//   });
//   await Dio().post("/info", data: formData);
// }
