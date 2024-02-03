import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speech_emotion_recognition_project/core/constants/api_constants.dart';
import 'package:speech_emotion_recognition_project/core/helpers/cash_helper.dart';
import 'package:speech_emotion_recognition_project/core/helpers/dio_helper.dart';

import '../../models/user_model.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(SettingsInitial());

  static AccountCubit get(context) => BlocProvider.of(context);
  final ImagePicker _picker = ImagePicker();
  File? photo;
  UserModel? userModel;

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
}
