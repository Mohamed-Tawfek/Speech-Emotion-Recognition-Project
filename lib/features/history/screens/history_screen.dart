import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/features/history/controller/history_cubit/history_state.dart';
import 'package:speech_emotion_recognition_project/features/share/model/followed_model.dart';

import '../../../modes_controller/modes_cubit.dart';
import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';
import '../controller/history_cubit/history_cubit.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key, this.model, this.forDisplaySharing = false});
  final FollowedModel? model;
  final bool forDisplaySharing;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryCubit(forDisplaySharing:forDisplaySharing,model: model ),
      child: BlocBuilder<HistoryCubit, HistoryState>(
        builder: (context, state) {
          HistoryCubit cubit = HistoryCubit.get(context);

          bool appMode = AppModeCubit.get(context).isDark;
          return Scaffold(
            appBar: forDisplaySharing
                ? AppBar(
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        context.pop();
                      },
                    ),
                    title: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(model!.userImage),
                          radius: 20,
                        ),
                        SizedBox(
                          width: context.deviceWidth * 0.05,
                        ),
                        Text(
                          model!.userName,
                          style: TextStyle(
                            fontSize: 18.sp,
                          ),
                        ),
                      ],
                    ),
                    centerTitle: true,
                  )
                : AppBar(
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        context.pop();
                      },
                    ),
                    title: Text('Statistics'.tr(),
                    style: TextStyle(
                      fontSize: 20.sp
                    ),
                    ),
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
                      color: appMode
                          ? DarkColors.buttonNavColor
                          : LightColors.buttonNavColor,
                      backgroundColor: appMode
                          ? DarkColors.buttonNavBackgroundColor
                          : LightColors.buttonNavBackgroundColor,
                      items: <Widget>[
                        Text(
                          'Day'.tr(),
                          style: TextStyle(
                              fontSize: 10.sp,
                              color: appMode
                                  ? DarkColors.textColor
                                  : LightColors.textColor),
                        ),
                        Text(
                          'Week'.tr(),
                          style: TextStyle(
                              fontSize: 10.sp,
                              color: appMode
                                  ? DarkColors.textColor
                                  : LightColors.textColor),
                        ),
                        Text(
                          'Month'.tr(),
                          style: TextStyle(
                              fontSize: 10.sp,
                              color: appMode
                                  ? DarkColors.textColor
                                  : LightColors.textColor),
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
