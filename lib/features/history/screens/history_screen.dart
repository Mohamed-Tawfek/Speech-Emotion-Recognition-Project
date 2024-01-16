import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/features/history/controller/history_cubit/history_state.dart';

import '../../../Languages_and_modes_controller/mode_scubit_cubit.dart';
import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';
import '../controller/history_cubit/history_cubit.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryCubit(),
      child: BlocBuilder<HistoryCubit, HistoryState>(
        builder: (context, state) {
          HistoryCubit cubit = HistoryCubit.get(context);


          bool appMode=AppModeCubit.get(context).isDark;
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: (){
                  context.pop();
                },
              ),
              title:   Text('History'.tr()),
              centerTitle: true,
            ),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: context.deviceWidth * 0.01,
                  vertical: context.deviceHeight * 0.02,
                ),
                child: Column(
                  children: [
                    CurvedNavigationBar(
                      color: appMode?DarkColors.buttonNavColor: LightColors.buttonNavColor
                      ,
                      backgroundColor: appMode?DarkColors.buttonNavBackgroundColor: LightColors.buttonNavBackgroundColor
                      ,
                      items: <Widget>[
                        Text(
                          'Day'.tr(),
                          style: TextStyle(
                              fontSize: 10.sp,
                              color: appMode?DarkColors.textColor: LightColors.textColor
                          ),
                        ),
                        Text(
                          'Week'.tr(),
                          style: TextStyle(
                              fontSize: 10.sp,
                              color: appMode?DarkColors.textColor: LightColors.textColor
                          ),
                        ),
                        Text(
                          'Month'.tr(),
                          style: TextStyle(
                              fontSize: 10.sp,
                              color: appMode?DarkColors.textColor: LightColors.textColor
                          ),
                        ),
                      ],
                      onTap: (index) {
                        cubit.changeScreen(index);
                      },
                    ),
                    cubit.screens[cubit.currentIndex],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
