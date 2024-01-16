
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';

import '../../../Languages_and_modes_controller/mode_scubit_cubit.dart';
import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';

class AboutUsScreen extends StatelessWidget {
   const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isArabic=context.locale.toString()=='ar';

    bool appMode = AppModeCubit.get(context).isDark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About us'.tr(),
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
                      color: appMode
                          ? DarkColors.primary
                          : LightColors.primary


                  ),
                ),
                SizedBox(
                  height: context.deviceHeight * 0.02,
                ),
               if(!isArabic)
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.deviceWidth * 0.04),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Our Team'.tr(),
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: appMode
                                ? DarkColors.textColor
                                : LightColors.textColor)),
                  ),
                ),
                if(isArabic)
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.deviceWidth * 0.04),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text('Our Team'.tr(),
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TeamMemberWidget(
                      name: 'Mohamed Tawfek'.tr(),
                      imagePath: 'assets/images/tawfek.jpg',
                      job: 'Flutter Developer'.tr(),
                    ),
                    _buildDivider(context),
                    TeamMemberWidget(
                      name: 'Nourhan Gamal'.tr(),
                      imagePath: 'assets/images/woman.png',
                      job: 'Machine Learning\n Engineer'.tr(),
                    ),
                    _buildDivider(context),
                    TeamMemberWidget(
                      name: 'Nourhan Hassan'.tr(),
                      imagePath: 'assets/images/woman.png',
                      job: 'Machine Learning\n Engineer'.tr(),
                    ),
                  ],
                ),
               // _buildDivider(context),
                _buildDivider(context),

                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TeamMemberWidget(
                      name: 'Mohamed Ahmed'.tr(),
                      imagePath: 'assets/images/mashoour.jpg',
                      job: 'Node js Developer'.tr(),
                    ),
                    _buildDivider(context),
                    TeamMemberWidget(
                      name: 'Somia saad'.tr(),
                      imagePath: 'assets/images/woman.png',
                      job: 'Node js Developer'.tr(),
                    ),
                    _buildDivider(context),
                    TeamMemberWidget(
                      name: 'Shahd Bahgat'.tr(),
                      imagePath: 'assets/images/woman.png',
                      job: 'UI Designer'.tr(),
                    ),
                  ],
                ),
                _buildDivider(context),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      TeamMemberWidget(
                      name: 'Shahd Allam'.tr(),
                      imagePath: 'assets/images/woman.png',
                      job: 'System analyst &\n Documentation\n Writer'.tr(),
                    ),
                    _buildDivider(context),
                      TeamMemberWidget(
                      name: 'Mohamed Saeed'.tr(),
                      imagePath: 'assets/images/saeed.jpg',
                      job: 'React Developer'.tr(),
                    ),
                    _buildDivider(context),
                      TeamMemberWidget(
                      name: 'Ziad Ahmed'.tr(),
                      imagePath: 'assets/images/ziad.jpg',
                      job: 'React Developer'.tr(),
                    ),
                  ],
                ),
                _buildDivider(context),

                if(!isArabic)
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.deviceWidth * 0.03),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('About App'.tr(),

                        style: TextStyle(
                            fontSize: 20.sp,

                            fontWeight: FontWeight.bold,
                            color: appMode
                                ? DarkColors.textColor
                                : LightColors.textColor)),
                  ),
                ),


     if(isArabic)
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.deviceWidth * 0.03),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text('About App'.tr(),

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
                        'In this application, we help psychiatrists monitor the condition of their patients remotely and show them detailed statistics about their patients’ psychological condition at every moment.'.tr(),
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: appMode
                                ? DarkColors.textColor
                                : LightColors.textColor)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _buildDivider(BuildContext context) {
    return SizedBox(
      height: context.deviceHeight * 0.04,
     // width: context.deviceWidth * 0.02,
    );
  }
}

class TeamMemberWidget extends StatelessWidget {
  const TeamMemberWidget(
      {super.key,
      required this.name,
      required this.imagePath,
      required this.job});

  final String imagePath;
  final String name;
  final String job;
  @override
  Widget build(BuildContext context) {
    bool appMode = AppModeCubit.get(context).isDark;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsetsDirectional.all(5),
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Color(0xffCA4B7F)),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: CircleAvatar(
            backgroundImage: AssetImage(
              imagePath,
            ),
            radius: context.deviceWidth * 0.10,
          ),
        ),
        SizedBox(
          height: context.deviceHeight * 0.010,
        ),
        Text(
          name,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: appMode ? DarkColors.textColor : LightColors.textColor),
        ),
        Text(
          job,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: appMode
                  ? DarkColors.subtitleColor
                  : LightColors.subtitleColor),
        ),
      ],
    );
  }
}
