import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:speech_emotion_recognition_project/core/components/dialogs.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/core/components/toast.dart';
import 'package:speech_emotion_recognition_project/core/constants/api_constants.dart';
import 'package:speech_emotion_recognition_project/core/helpers/dio_helper.dart';
import 'package:speech_emotion_recognition_project/features/suggestion/screens/thanks_screen.dart';

import '../screens/suggestion_screen.dart';

part 'suggestion_state.dart';

class SuggestionCubit extends Cubit<SuggestionState> {
  SuggestionCubit() : super(SuggestionInitial());
static  SuggestionCubit get(context)=>BlocProvider.of(context);
  sendSuggestion({required String message, required BuildContext context}) {
    showLoadingDialog(context);
    var headers = {'Content-Type': 'application/json'};

    DioHelper.post(
            url: ApiConstants.suggestionEndPoint,
            data: {"message": message},
            headers: headers)
        .then((response) {
      if (response.statusCode == 200) {
        context.pop;


        Navigator.pop(context);
         showThanksBottomSheet(context);
      }

    }).catchError((error){
      context.pop;
      showToast(context, error.toString());
    });
  }
}
