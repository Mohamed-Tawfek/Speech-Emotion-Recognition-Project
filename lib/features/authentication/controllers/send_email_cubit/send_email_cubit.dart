import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:speech_emotion_recognition_project/core/components/dialogs.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/core/components/toast.dart';
import 'package:speech_emotion_recognition_project/core/constants/api_constants.dart';
import 'package:speech_emotion_recognition_project/core/helpers/dio_helper.dart';

import '../../models/send_email_model.dart';

part 'send_email_state.dart';

class SendEmailCubit extends Cubit<SendEmailState> {
  SendEmailCubit() : super(SendEmailInitial());
static  SendEmailCubit get(context)=>BlocProvider.of(context);
  SendEmailModel? sendEmailModel;
Future  sendVerificationLink({required String email, required BuildContext context})async {
    showLoadingDialog(context);
    var headers = {'Content-Type': 'application/json'};
  await  DioHelper.post(
            url: ApiConstants.verifyEmailEndPoint,
            data: {"email": email},
            headers: headers)
        .then((response) {
      context.pop;
      sendEmailModel = SendEmailModel.fromJson(response.data);

      showToast(context, sendEmailModel!.message);
    }).catchError((error) {
      context.pop;
      showToast(context, error.toString());
    });
  }

sendResetPasswordLink(){}

}
