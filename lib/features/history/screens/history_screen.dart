import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/features/history/controller/history_cubit/history_state.dart';

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
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: (){
                  context.pop();
                },
              ),
              title: const Text('History'),
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
                      color: Color(0xffF8EDFA),
                      backgroundColor: Colors.white,
                      items: <Widget>[
                        Text(
                          'Day',
                          style: TextStyle(
                              fontSize: 10.sp,
                              color: cubit.currentIndex == 0
                                  ? Color(0xffEF5794)
                                  : Color(0xffAE10DF)),
                        ),
                        Text(
                          'Week',
                          style: TextStyle(
                              fontSize: 10.sp,
                              color: cubit.currentIndex == 1
                                  ? Color(0xffEF5794)
                                  : Color(0xffAE10DF)),
                        ),
                        Text(
                          'Month',
                          style: TextStyle(
                              fontSize: 10.sp,
                              color: cubit.currentIndex == 2
                                  ? Color(0xffEF5794)
                                  : Color(0xffAE10DF)),
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
