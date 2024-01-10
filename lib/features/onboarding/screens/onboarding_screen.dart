import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});
  List<OnBoardingModel> onBoardingItems = [
    OnBoardingModel(
        title: 'Recognition Emotions',
        body:
            'It takes sound and images, analyzes them and extracts the current feeling',
        lottiePath: 'assets/lotties/emotions.json'),
    OnBoardingModel(
        title: 'History',
        body:
            'It creates a history of your own that contains all your feelings over time',
        lottiePath: 'assets/lotties/saving.json'),
    OnBoardingModel(
        title: 'Analysis',
        body:
            'It analyzes your history and shows it to you in a simplified way',
        lottiePath: 'assets/lotties/barchart.json'),
    OnBoardingModel(
        title: 'Security',
        body: 'Don\'t worry, all your data is Protected',
        lottiePath: 'assets/lotties/security.json'),
  ];
  PageController _pageController = PageController();
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
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
                    if (index == onBoardingItems.length - 1) {
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
                    activeDotColor: Color(0xffCA4B7F)),
              ),
              SizedBox(
                height: context.deviceHeight * 0.1,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: context.deviceHeight * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OnBoardingBtn(
                      textChild: 'Back',
                      onPressed: () {
                        _pageController.previousPage(
                            duration: const Duration(milliseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn);
                      },
                      hasBackground: false,
                    ),
                    OnBoardingBtn(
                      textChild: 'Next',
                      onPressed: () {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn);
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

class OnBoardingBtn extends StatelessWidget {
  const OnBoardingBtn(
      {super.key,
      required this.hasBackground,
      required this.onPressed,
      required this.textChild});
  final void Function()? onPressed;
  final bool hasBackground;
  final String textChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.deviceHeight * 0.08,
      width: context.deviceWidth * 0.4,
      decoration: BoxDecoration(
          color: hasBackground ? const Color(0xffCA4B7F) : null,
          borderRadius: BorderRadius.circular(30)),
      child: MaterialButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: onPressed,
        child: Text(
          textChild,
          style: TextStyle(
              color: hasBackground ? Colors.white : const Color(0xff7180b7),
              fontSize: 18.sp),
        ),
      ),
    );
  }
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: context.deviceHeight * 0.35,
          width: context.deviceWidth * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(250),
            color: Color(0xffCA4B7F),
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
              color: const Color(0xff404677)),
        ),
        SizedBox(
          height: context.deviceHeight * 0.03,
        ),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(
              horizontal: context.deviceWidth * 0.1),
          child: Text(
            body,
            style: TextStyle(fontSize: 15.sp, color: const Color(0xff7180b7)),
          ),
        ),
      ],
    );
  }
}
