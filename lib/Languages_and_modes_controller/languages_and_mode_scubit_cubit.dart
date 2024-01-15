import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'languages_and_mode_scubit_state.dart';

class LanguagesAndModesCubit extends Cubit<LanguagesAndModeScubitState> {
  LanguagesAndModesCubit() : super(LanguagesAndModeScubitInitial()){

  }
 static LanguagesAndModesCubit get(context)=>BlocProvider.of(context);

bool isDark=false;
bool isArabic=false;

changeAppMode(){
  isDark=!isDark;
   emit(ChangeModeState());

}

 changeAppLanguageToAR(BuildContext context) {

  isArabic = true;
  context.setLocale( Locale('ar'));
  print(context.locale);
  emit(ChangeLanguagesToARState());
}
  changeAppLanguageToEN(BuildContext context) {
  isArabic = false;
  context.setLocale( Locale('en'));
  print(context.locale);

  emit(ChangeLanguagesToENState());
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
