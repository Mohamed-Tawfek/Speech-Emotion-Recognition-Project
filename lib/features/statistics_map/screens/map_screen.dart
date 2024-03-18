import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/core/constants/dark_theme_colors.dart';
import 'package:speech_emotion_recognition_project/core/constants/light_theme_colors.dart';
import 'package:speech_emotion_recognition_project/features/statistics_map/controller/statistics_map_controller/statistics_map_cubit.dart';

import '../../../modes_controller/modes_cubit.dart';

class MapScreen extends StatelessWidget {
  MapScreen({super.key});
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => StatisticsMapCubit()..getData(),
        child: BlocBuilder<StatisticsMapCubit, StatisticsMapState>(
          builder: (context, state) {
            StatisticsMapCubit cubit = StatisticsMapCubit.get(context);
            bool appMode = AppModeCubit.get(context).isDark;
            return Column(
              children: [
                Expanded(
                  child: GoogleMap(
                    initialCameraPosition: cubit.kGooglePlex,
                    zoomControlsEnabled: false,
                    onMapCreated: (GoogleMapController controller) {
                      StatisticsMapCubit.get(context).setMapController(mapController: controller);
                    },
                    onTap: (LatLng latLng) {},
                    liteModeEnabled: false,
                    mapType: MapType.normal,
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    markers: cubit.markers,
                  ),
                ),
                SizedBox(
                  height: context.deviceHeight * 0.015,
                ),
                BuildSelectionBar(
                  appMode: appMode,
                  labels: cubit.statisticsList,
                  selectedIndex: cubit.statisticsIndex,
                  selectedLabel: cubit.changeStatisticsToggle,
                ),
                if (cubit.weeklyIsSelected)
                  SizedBox(
                    height: context.deviceHeight * 0.015,
                  ),
                if (cubit.weeklyIsSelected)
                  BuildSelectionBar(
                    appMode: appMode,
                    labels: cubit.weeklyList,
                    selectedIndex: cubit.weeklyIndex,
                    selectedLabel: cubit.changeWeeklyToggle,
                  ),
                if (cubit.monthlyIsSelected)
                  SizedBox(
                    height: context.deviceHeight * 0.015,
                  ),
                if (cubit.monthlyIsSelected)
                  BuildSelectionBar(
                    appMode: appMode,
                    labels: cubit.monthlyList,
                    selectedIndex: cubit.monthlyIndex,
                    selectedLabel: cubit.changeMonthlyToggle,
                  ),
                SizedBox(
                  height: context.deviceHeight * 0.015,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                      horizontal: context.deviceWidth * 0.01),
                  child: FlutterToggleTab(
                    width: context.deviceWidth * 0.2, // width in percent
                    borderRadius: 30,
                    height: context.deviceHeight * 0.05,
                    selectedIndex: cubit.emotionIndex,
                    selectedBackgroundColors: [
                      appMode ? DarkColors.primary : LightColors.primary
                    ],
                    selectedTextStyle: TextStyle(
                        color: appMode
                            ? DarkColors.scaffoldColor
                            : LightColors.scaffoldColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700),

                    unSelectedTextStyle: TextStyle(
                        color: appMode
                            ? DarkColors.textColor
                            : LightColors.textColor,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500),
                    labels: cubit.emotionList,
                    unSelectedBackgroundColors: [
                      appMode
                          ? DarkColors.buttonNavColor
                          : LightColors.buttonNavColor
                    ],
                    selectedLabelIndex: (index) {
                      cubit.changeEmotionToggle(index);
                    },
                    isScroll: false,
                  ),
                ),
                SizedBox(
                  height: context.deviceHeight * 0.02,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class BuildSelectionBar extends StatelessWidget {
  const BuildSelectionBar(
      {super.key,
      required this.appMode,
      required this.selectedIndex,
      required this.labels,
      this.selectedLabel});

  final bool appMode;
  final int selectedIndex;
  final List<String> labels;
  final selectedLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
          horizontal: context.deviceWidth * 0.01),
      child: FlutterToggleTab(
        width: context.deviceWidth * 0.2, // width in percent
        borderRadius: 30,
        height: context.deviceHeight * 0.05,
        selectedIndex: selectedIndex,
        selectedBackgroundColors: [
          appMode ? DarkColors.primary : LightColors.primary
        ],
        selectedTextStyle: TextStyle(
            color:
                appMode ? DarkColors.scaffoldColor : LightColors.scaffoldColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w700),

        unSelectedTextStyle: TextStyle(
            color: appMode ? DarkColors.textColor : LightColors.textColor,
            fontSize: 10.sp,
            fontWeight: FontWeight.w500),
        labels: labels,
        unSelectedBackgroundColors: [
          appMode ? DarkColors.buttonNavColor : LightColors.buttonNavColor
        ],
        selectedLabelIndex: (index) {
          selectedLabel(index);
        },
        isScroll: false,
      ),
    );
  }
}
