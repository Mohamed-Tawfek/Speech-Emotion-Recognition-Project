import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speech_emotion_recognition_project/core/components/dialogs.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/core/components/toast.dart';
import 'package:speech_emotion_recognition_project/core/constants/api_constants.dart';
import 'package:speech_emotion_recognition_project/core/helpers/cash_helper.dart';
import 'package:speech_emotion_recognition_project/core/helpers/dio_helper.dart';
import 'package:speech_emotion_recognition_project/features/authentication/screens/login_screen.dart';

import '../../models/delete_account_model.dart';
import '../../models/user_model.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(SettingsInitial());

  static AccountCubit get(context) => BlocProvider.of(context);
  final ImagePicker _picker = ImagePicker();
  File? photo;
  UserModel? userModel;
 static DeleteAccountModel? deleteAccountModel;
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

 static Future<void> removeAccount(BuildContext context) async {
    String token = CashHelper.getData(key: 'token');

    showLoadingDialog(context);
    var headers = {'token': token};
    DioHelper.delete(url: ApiConstants.removeAccountEndPoint, headers: headers)
        .then((value) async{
      deleteAccountModel = DeleteAccountModel.fromJson(value.data);
      context.pop;
      showToast(context, deleteAccountModel!.message);

      if (value.statusCode == 200) {
        context.pushAndRemoveUntil(LoginScreen());
        await   CashHelper.remove(key: 'token');
        await CashHelper.remove(key: 'userEmail');
        await CashHelper.remove(key: 'userImage');
        await CashHelper.remove(key: 'userName');
      }
    }).catchError((error){
      context.pop;
       showToast(context, error.toString());

    });
  }

  static Future<void> logout(BuildContext context) async {
    String token = CashHelper.getData(key: 'token');

    showLoadingDialog(context);
    var headers = {'token': token};
    DioHelper.patch(url: ApiConstants.logoutEndPoint, headers: headers, )
        .then((value)async {

          print('value.data'*20);
          print(value.data);
          print('value.data'*20);
       context.pop;
      if (value.statusCode == 200) {
        context.pushAndRemoveUntil(LoginScreen());
        await   CashHelper.remove(key: 'token');
        await CashHelper.remove(key: 'userEmail');
        await CashHelper.remove(key: 'userImage');
        await CashHelper.remove(key: 'userName');
      }
    }).catchError((error){
      context.pop;
      showToast(context, error.toString());

    });
  }
}
