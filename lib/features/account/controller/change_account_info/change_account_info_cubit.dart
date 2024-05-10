import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/features/speech/screens/speech_screen.dart';

import '../../../../core/components/dialogs.dart';
import '../../../../core/components/toast.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/helpers/cash_helper.dart';
import '../../../../core/helpers/dio_helper.dart';
import '../../models/change_account_model.dart';
import '../../models/user_model.dart';

part 'change_account_info_state.dart';

class ChangeAccountInfoCubit extends Cubit<ChangeAccountInfoState> {
  ChangeAccountInfoCubit() : super(ChangeAccountInfoInitial());

  static ChangeAccountInfoCubit get(context) => BlocProvider.of(context);
  final ImagePicker _picker = ImagePicker();
  File? photo;
  UserModel? userModel;
  ChangeAccountModel? changeAccountModel;

  Future<void> getAccountInfo() async {
    userModel = null;
    emit(GetAccountLoadingState());

    String token = CashHelper.getData(key: 'token');
    DioHelper.get(
        url: ApiConstants.accountInfoEndPoint,
        headers: {'token': token}).then((response) {
      userModel = UserModel.fromJson(response.data);

      emit(GetAccountSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());

      emit(GetAccountErrorState());
    });
  }

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

  Future<void> changeData(
      {required birthDate,
      required firstName,
      required lastName,
      required gender,
      required phone,
      required BuildContext context}) async {
    showLoadingDialog(context);
    String token = CashHelper.getData(key: 'token');

    var formData = photo != null
        ? FormData.fromMap({
            'image': [
              await MultipartFile.fromFile(photo!.path, filename: photo!.path)
            ],
            "firstname": firstName,
            "lastname": lastName,
            "gender": gender,
            "birthday": birthDate,
            "phone": phone,
          })
        : FormData.fromMap({
            "firstname": firstName,
            "lastname": lastName,
            "gender": gender,
            "birthday": birthDate,
            "phone": phone,
          });

    DioHelper.put(
        url: ApiConstants.changeAccountInfoEndPoint,
        data: formData,
        headers: {'token': token}).then((Response response) {
      changeAccountModel = ChangeAccountModel.fromJson(response.data);
      CashHelper.setData(key: 'userEmail', value: changeAccountModel!.email);
      CashHelper.setData(key: 'userImage', value: changeAccountModel!.imgCover);
      CashHelper.setData(key: 'userName', value: changeAccountModel!.fullName);

      print(response.data);

      Navigator.of(context).pop();
      if (response.statusCode == 200) {
        context.pushAndRemoveUntil(const SpeechScreen());
        showToast(context, 'Information has been updated');
      } else {
        showToast(context, 'There is an error');
      }
    });
  }
}
