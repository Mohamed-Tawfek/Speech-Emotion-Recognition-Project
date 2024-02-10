import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:speech_emotion_recognition_project/core/components/dialogs.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/core/components/toast.dart';
import 'package:speech_emotion_recognition_project/core/constants/api_constants.dart';
import 'package:speech_emotion_recognition_project/core/helpers/cash_helper.dart';
import 'package:speech_emotion_recognition_project/core/helpers/dio_helper.dart';
import 'package:speech_emotion_recognition_project/features/speech/screens/speech_screen.dart';

import '../../models/change_password_model.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());
static  ChangePasswordCubit get(context)=>BlocProvider.of(context);
  ChangePasswordModel? changePasswordModel;
 Future changePassword({
    required String oldPassword,
    required String newPassword,
    required BuildContext context,
  }) async {
   emit(ChangePasswordLoadingState());
    showLoadingDialog(context);
    String token = CashHelper.getData(key: 'token');
    var headers = {'token': token, 'Content-Type': 'application/json'};

    await DioHelper.patch(
            data: {"oldPassword": oldPassword, "newPassword": newPassword},
            url: ApiConstants.changePasswordEndPoint,
            headers: headers)
        .then((value) {

      emit(ChangePasswordSuccessState());
      changePasswordModel=ChangePasswordModel.fromJson(value.data);
      showToast(context, changePasswordModel!.message);
      context.pop;

      if (value.statusCode == 200) {


        context.pushAndRemoveUntil(const SpeechScreen());

      }


    }).catchError((error) {
      context.pop;
      emit(ChangePasswordErrorState());

      showToast(context, error.toString());

      debugPrint('there is an error in change password: ${error.toString()}');

    });


  }
}
