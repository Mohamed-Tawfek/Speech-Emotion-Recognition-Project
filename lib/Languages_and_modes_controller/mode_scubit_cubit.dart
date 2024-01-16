import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'scubit_state.dart';

class AppModeCubit extends Cubit<AppModeState> {
  AppModeCubit() : super(AppModeStateInitial());
 static AppModeCubit get(context)=>BlocProvider.of(context);

bool isDark=false;

changeAppMode(){
  isDark=!isDark;
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
