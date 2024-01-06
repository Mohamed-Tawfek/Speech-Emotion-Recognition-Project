import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About us',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: ()=>context.pop(),
          color: Colors.white,
          icon: const Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffCA4B7F),
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
              //crossAxisAlignment: CrossAxisAlignment.start,
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
                      color: Color(0xffCA4B7F)),
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
                            color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: context.deviceHeight * 0.03,
                ),
                Wrap(
                  children: [
                    const TeamMemberWidget(
                      name: 'Mohamed Tawfek',
                      imagePath: 'assets/images/tawfek.jpg',
                      job: 'Flutter Developer',
                    ),
                    _buildDivider(context),
                    const TeamMemberWidget(
                      name: 'Nourhan Gamal',
                      imagePath: 'assets/images/woman.png',
                      job: 'Machine Learning\n Engineer',
                    ),
                    _buildDivider(context),
                    const TeamMemberWidget(
                      name: 'Nourhan Hassan',
                      imagePath: 'assets/images/woman.png',
                      job: 'Machine Learning\n Engineer',
                    ),
                    _buildDivider(context),
                    const TeamMemberWidget(
                      name: 'Mohamed Ahmed',
                      imagePath: 'assets/images/mashoour.jpg',
                      job: 'Node js Developer',
                    ),
                    _buildDivider(context),
                    const TeamMemberWidget(
                      name: 'Somia saad',
                      imagePath: 'assets/images/woman.png',
                      job: 'Node js Developer',
                    ),
                    _buildDivider(context),
                    const TeamMemberWidget(
                      name: 'Shahd Bahgat',
                      imagePath: 'assets/images/woman.png',
                      job: 'UI Designer',
                    ),
                    _buildDivider(context),
                    const TeamMemberWidget(
                      name: 'Shahd Allam',
                      imagePath: 'assets/images/woman.png',
                      job: 'Documentation\n Writer',
                    ),
                    _buildDivider(context),
                    const TeamMemberWidget(
                      name: 'Mohamed Saeed',
                      imagePath: 'assets/images/saeed.jpg',
                      job: 'React Developer',
                    ),
                    _buildDivider(context),
                    const TeamMemberWidget(
                      name: 'Ziad Ahmed',
                      imagePath: 'assets/images/ziad.jpg',
                      job: 'React Developer',
                    ),
                  ],
                ),
                SizedBox(
                  height: context.deviceHeight * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.deviceWidth * 0.03),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('About App',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: context.deviceHeight * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.deviceWidth * 0.03),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        'In this application, we help psychiatrists monitor the condition of their patients remotely and show them detailed statistics about their patients’ psychological condition at every moment.',
                        style: TextStyle(
                            fontSize: 20.sp,

                            color: Colors.black)),
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
      height: context.deviceHeight * 0.21,
      width: context.deviceWidth * 0.02,
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
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          job,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
