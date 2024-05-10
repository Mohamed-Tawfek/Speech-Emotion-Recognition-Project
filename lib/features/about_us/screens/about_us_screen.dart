import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';
import '../../../modes_controller/modes_cubit.dart';
import '../widgets/support_palastine_widget.dart';
import '../widgets/team_info_widget.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    bool appMode = AppModeCubit.get(context).isDark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About us',
        ),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: context.deviceWidth,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: context.deviceHeight * 0.04,
                horizontal: context.deviceWidth * 0.02),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SupportPalastineWidget(),
                SizedBox(
                  height: context.deviceHeight * 0.04,
                ),
                Image.asset(
                  'assets/icons/app_icon.png',
                  height: 130,
                  width: 130,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: context.deviceHeight * 0.01,
                ),
                Text(
                  'SER',
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w900,
                      color:
                          appMode ? DarkColors.primary : LightColors.primary),
                ),
                SizedBox(
                  height: context.deviceHeight * 0.02,
                ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.deviceWidth * 0.04),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Our Team',
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: appMode
                                  ? DarkColors.textColor
                                  : LightColors.textColor)),
                    ),
                  ),


                SizedBox(
                  height: context.deviceHeight * 0.03,
                ),

                const TeamInfoWidget(),

                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.deviceWidth * 0.03),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Website',
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: appMode
                                  ? DarkColors.textColor
                                  : LightColors.textColor)),
                    ),
                  ),


                SizedBox(
                  height: context.deviceHeight * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.deviceWidth * 0.03),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('To visit our website',
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: appMode
                                    ? DarkColors.textColor
                                    : LightColors.textColor)),
                        SizedBox(
                          width: context.deviceWidth * 0.01,
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: _onTapWebsite,
                          child: Text(
                            'press here',
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: appMode
                                    ? DarkColors.primary
                                    : LightColors.primary),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                _buildDivider(context),
                //-------------------------------------------

                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.deviceWidth * 0.03),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('About App',
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: appMode
                                  ? DarkColors.textColor
                                  : LightColors.textColor)),
                    ),
                  ),


                SizedBox(
                  height: context.deviceHeight * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.deviceWidth * 0.03),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        'In this application, we help psychiatrists monitor the condition of their patients remotely and show them detailed statistics about their patients’ psychological condition at every moment.'
                            ,
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: appMode
                                ? DarkColors.textColor
                                : LightColors.textColor)),
                  ),
                ),

                //-------------------------------------------------
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapWebsite() {
    final Uri _url = Uri.parse(
      'https://speech-emotion-roan.vercel.app/',
    );
    launchUrl(_url, mode: LaunchMode.inAppBrowserView);
  }

}
SizedBox _buildDivider(BuildContext context) {
  return SizedBox(
    height: context.deviceHeight * 0.04,
    // width: context.deviceWidth * 0.02,
  );
}

