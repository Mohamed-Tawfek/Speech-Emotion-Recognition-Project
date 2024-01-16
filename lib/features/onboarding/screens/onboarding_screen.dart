import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/core/constants/dark_theme_colors.dart';
import 'package:speech_emotion_recognition_project/core/constants/light_theme_colors.dart';
import 'package:speech_emotion_recognition_project/features/authentication/screens/login_screen.dart';

import '../../../Languages_and_modes_controller/mode_scubit_cubit.dart';
import '../../../core/components/custom_btn.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});
  List<OnBoardingModel> onBoardingItems = [
    OnBoardingModel(
        title: 'Emotions Recognition'.tr(),
        body:
            'It takes speech and analyzes it and extracts the current emotion'.tr(),
        lottiePath: 'assets/lotties/emotions.json'),
    OnBoardingModel(
        title: 'History'.tr(),
        body:
            'It creates a history of your own that contains all your feelings over time'.tr(),
        lottiePath: 'assets/lotties/saving.json'),
    OnBoardingModel(
        title: 'Analysis'.tr(),
        body:
            'It analyzes your history and shows it to you in a simplified way'.tr(),
        lottiePath: 'assets/lotties/barchart.json'),
    OnBoardingModel(
        title: 'Security'.tr(),
        body: 'Don\'t worry, all your data is Protected'.tr(),
        lottiePath: 'assets/lotties/security.json'),
  ];
  final PageController _pageController = PageController();
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    bool appMode=AppModeCubit.get(context).isDark;

    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: context.deviceWidth,
        height: context.deviceHeight,
        child: Padding(
          padding: EdgeInsetsDirectional.only(top: context.deviceHeight * 0.1),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  onPageChanged: (int index) {
                    if (index == onBoardingItems.length -1) {
                      isLast = true;
                     } else {
                      isLast = false;
                    }
                  },
                  controller: _pageController,
                  physics: const BouncingScrollPhysics(),
                  itemCount: onBoardingItems.length,
                  itemBuilder: (_, i) => BuildOnBoardingItems(
                      lottiePath: onBoardingItems[i].lottiePath,
                      body: onBoardingItems[i].body,
                      title: onBoardingItems[i].title),
                ),
              ),

              SmoothPageIndicator(
                controller: _pageController,
                count: onBoardingItems.length,
                effect: ExpandingDotsEffect(
                    dotColor: Colors.grey.withOpacity(0.7),
                    dotHeight: 10,
                    dotWidth: 10,
                    activeDotColor:appMode?DarkColors.primary:LightColors.primary),
              ),
              SizedBox(
                height: context.deviceHeight * 0.07,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: context.deviceHeight * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomBtn(
                      textChild: 'Back'.tr(),
                      onPressed: () {
                        _pageController.previousPage(
                            duration: const Duration(milliseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn);
                      },
                      hasBackground: false,
                    ),
                    CustomBtn(
                      textChild: 'Next'.tr(),
                      onPressed: () {
                        if(isLast){
                          context.push(LoginScreen());


                        }else{
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 750),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }

                      },
                      hasBackground: true,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OnBoardingModel {
  String lottiePath;
  String title;
  String body;
  OnBoardingModel(
      {required this.title, required this.body, required this.lottiePath});
}


class BuildOnBoardingItems extends StatelessWidget {
  const BuildOnBoardingItems(
      {super.key,
      required this.lottiePath,
      required this.body,
      required this.title});
  final String lottiePath;
  final String title;
  final String body;
  @override
  Widget build(BuildContext context) {
    bool appMode=AppModeCubit.get(context).isDark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: context.deviceHeight * 0.4,
          width: context.deviceWidth * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(250),
            color: appMode?DarkColors.primary:LightColors.primary,
          ),
          child: Lottie.asset(
            lottiePath,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: context.deviceHeight * 0.03,
        ),
        Text(
          textAlign: TextAlign.center,
          title,
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: appMode?DarkColors.onBoardingTitleColor:LightColors.onBoardingTitleColor),
        ),
        SizedBox(
          height: context.deviceHeight * 0.03,
        ),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(
              horizontal: context.deviceWidth * 0.1),
          child: Text(
            body,
            style: TextStyle(fontSize: 15.sp, color:
            appMode?DarkColors.onBoardingBodyColor:LightColors.onBoardingBodyColor
            ),
          ),
        ),
      ],
    );
  }
}
