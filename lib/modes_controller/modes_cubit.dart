import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:speech_emotion_recognition_project/core/helpers/cash_helper.dart';

part 'modes_state.dart';

class AppModeCubit extends Cubit<AppModeState> {
  AppModeCubit() : super(AppModeStateInitial());
 static AppModeCubit get(context)=>BlocProvider.of(context);

bool isDark=false;
init(){

  isDark= CashHelper.getData(key: 'isDark')??false;



}
changeAppMode(){
  isDark=!isDark;
  CashHelper.setData(key: 'isDark', value: isDark);


   emit(ChangeModeState());

}


// }
// changeAppLanguage(BuildContext context){
//
//
//   if(isArabic){
//     context.setLocale(Locale('ar'));
//
//   }else{
//     context.setLocale(Locale('en'));
//   }
//   if(context.locale.languageCode=='ar'){
//     isArabic=true;
//   }
//   else{
//     isArabic=false;
//   }
// emit(ChangeLanguagesState());
// }
//






}
