 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/custom_btn.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/features/suggestion/controller/suggestion_cubit.dart';
import 'package:speech_emotion_recognition_project/features/suggestion/screens/thanks_screen.dart';

import '../../../modes_controller/modes_cubit.dart';
import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';

class SuggestionScreen extends StatefulWidget {
  const SuggestionScreen({super.key});

  @override
  State<SuggestionScreen> createState() => _SuggestionScreenState();
}

class _SuggestionScreenState extends State<SuggestionScreen> {
  TextEditingController messageController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    bool appMode = AppModeCubit.get(context).isDark;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: context.deviceHeight,
        padding: EdgeInsetsDirectional.symmetric(
            horizontal: context.deviceWidth * 0.04),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: TextFormField(
                  controller: messageController,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'this field is required!';
                    }
                  },
                  maxLength: 100,
                  maxLines: 10,
                  style: TextStyle(

                      color: appMode
                          ? DarkColors.textInFieldColor
                          : LightColors.textInFieldColor),
                  decoration: InputDecoration(
                    hintText:'Suggest how this app can be improved' ,
                      helperStyle: TextStyle(
                        fontSize: 13.sp,
                        color: appMode
                            ? DarkColors.textInFieldColor
                            : LightColors.textInFieldColor
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
              SizedBox(
                height: context.deviceHeight * 0.05,
              ),
              BlocProvider(
                create: (context) => SuggestionCubit(),
                child: BlocBuilder<SuggestionCubit, SuggestionState>(
                  builder: (context, state) {
                    return CustomBtn(
                        hasBackground: true,
                        onPressed: () => _sendBtn(context),
                        textChild: 'Send' );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _sendBtn(context) {
    if (_formKey.currentState!.validate()) {
      SuggestionCubit.get(context)
          .sendSuggestion(message: messageController.text, context: context);
    }
  }
}

showThanksBottomSheet(BuildContext context) {
  context.pop;
  bool appMode = AppModeCubit.get(context).isDark;

  Navigator.pop(context);
  showModalBottomSheet(
      context: context,
      builder: (_) {
        return const ThanksScreen();
      },
      isScrollControlled: true,
      barrierColor: appMode ? DarkColors.primary : LightColors.primary,
      useSafeArea: true);
}
