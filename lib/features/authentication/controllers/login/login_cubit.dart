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
import 'package:speech_emotion_recognition_project/features/authentication/models/login_model.dart';
import 'package:speech_emotion_recognition_project/features/speech/screens/speech_screen.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  LoginModel? loginModel;

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    showLoadingDialog(context);
    DioHelper.post(
        url: ApiConstants.loginEndPoint,
        data: {"email": email, "password": password}).then((response) async {
      loginModel = LoginModel.fromJson(response.data, response.statusCode);

      print(response.data);
      if (response.statusCode == 200) {
        context.pop();

        context.pushAndRemoveUntil(const SpeechScreen());
        showToast(context, 'You have been logged in successfully' );
        await CashHelper.setData(key: 'token', value: loginModel!.token);
        await CashHelper.setData(key: 'userID', value: loginModel!.id);
        await CashHelper.setData(key: 'userEmail', value: loginModel!.email);
        await CashHelper.setData(key: 'userImage', value: loginModel!.image);
        await CashHelper.setData(key: 'userName', value: loginModel!.userName);
      } else {
        context.pop();
        showToast(context, loginModel!.message);
      }
    });
  }
}
