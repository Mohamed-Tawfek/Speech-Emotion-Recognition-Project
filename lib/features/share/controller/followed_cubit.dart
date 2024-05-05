import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:speech_emotion_recognition_project/core/helpers/cash_helper.dart';

import '../model/followed_model.dart';
import '../screens/follow_screen.dart';

part 'followed_state.dart';

class FollowedCubit extends Cubit<FollowedState> {
  FollowedCubit() : super(FollowedInitial());
  List<FollowedModel> followed = [];
static  FollowedCubit get(context)=>BlocProvider.of(context);
  void addFollowed(
      {required context,
       required token,
      required userEmail,
      required userImage,
      required userID,
      required userName}) {
    String? result = CashHelper.getData(key: 'followed');
    if(result!=null) {
      List j = const JsonDecoder().convert(result);
      j.add({
        'userImage': userImage,
        'userName': userName,
        'userEmail': userEmail,
        'token': token,
        'userID': userID,
      });
      CashHelper.setData(
          key: 'followed', value: const JsonEncoder().convert(j));
    }
    else{
      List j = [];
      j.add({
        'userImage': userImage,
        'userName': userName,
        'userEmail': userEmail,
        'token': token,
        'userID':userID
      });
      CashHelper.setData(
          key: 'followed', value: const JsonEncoder().convert(j));

    }
 Navigator.pop(context);
    emit(AddFollowedState());
    showDialog(
        context: context,
        builder: (_) => const AlertDialog(
          content: SynchronizingWidget(),
        ));
    getFollowed();


  }

  getFollowed() {
    followed = [];
    String? result = CashHelper.getData(key: 'followed');
if(result!=null) {
      List j = const JsonDecoder().convert(result);
      j.forEach((followed) {
        this.followed.add(FollowedModel(followed));
      });
    }
    emit(GetFollowedState());
  }

  removeFollowed({required int index,required context}) {
    String? result = CashHelper.getData(key: 'followed');
    if(result!=null) {
      List j = const JsonDecoder().convert(result);
      j.removeAt(index);
      CashHelper.setData(
          key: 'followed', value: const JsonEncoder().convert(j));
    }
    Navigator.pop(context);
    emit(RemoveFollowedState());
    getFollowed();
  }
}
