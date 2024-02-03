import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/core/constants/dark_theme_colors.dart';
import 'package:speech_emotion_recognition_project/core/constants/light_theme_colors.dart';
import 'package:speech_emotion_recognition_project/core/helpers/cash_helper.dart';
import 'package:speech_emotion_recognition_project/features/authentication/screens/login_screen.dart';
import 'package:speech_emotion_recognition_project/features/onboarding/screens/onboarding_first_screen.dart';
import 'package:speech_emotion_recognition_project/features/onboarding/screens/onboarding_second_screen.dart';
import 'package:speech_emotion_recognition_project/features/onboarding/screens/onboarding_third_screen.dart';

import '../../../core/components/change_mode_widget.dart';
import '../../../modes_controller/modes_cubit.dart';
import '../../../core/components/custom_btn.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});
  List<Widget>screens=[

    OnBoardingFirstScreen(),
    OnBoardingSecondScreen(),
    OnBoardingThirdScreen()

  ];

  final PageController _pageController = PageController();

  bool isLast = false;
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {


  @override
  Widget build(BuildContext context) {
    bool appMode=AppModeCubit.get(context).isDark;

    return Scaffold(
      appBar: AppBar(
        actions: const [
          ChangeModeWidget(),
        ],
      ),
      body: SizedBox(
        width: context.deviceWidth,
        height: context.deviceHeight,
        child: Padding(
          padding: EdgeInsetsDirectional.only(top: context.deviceHeight * 0.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  onPageChanged: (int index) {
                    if (index == widget.screens.length -1) {

                      setState(() {
                        widget.isLast = true;
                      });
                     } else {
                      setState(() {
                        widget. isLast = false;
                      });

                    }
                  },
                  controller:widget. _pageController,
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.screens.length,
                  itemBuilder: (_, i) => widget.screens[i],
                ),
              ),

              SmoothPageIndicator(
                controller: widget._pageController,
                count: widget.screens.length,
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
                        widget. _pageController.previousPage(
                            duration: const Duration(milliseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn);
                      },
                      hasBackground: false,
                    ),
                    CustomBtn(
                      textChild:widget. isLast?'Get Started':'Next'.tr(),
                      onPressed: () {
                        if(widget.isLast){
                          context.push(LoginScreen());
 CashHelper.setData(key: 'OnBoardingShown', value: true);

                        }else{
                          widget. _pageController.nextPage(
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
