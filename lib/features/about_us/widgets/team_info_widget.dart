 import 'package:flutter/cupertino.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/features/about_us/widgets/team_member_widget.dart';

class TeamInfoWidget extends StatelessWidget {
  const TeamInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
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
          ],
        ),
        // _buildDivider(context),
        _buildDivider(context),

        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
          ],
        ),
        _buildDivider(context),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TeamMemberWidget(
              name: 'Shahd Allam',
              imagePath: 'assets/images/woman.png',
              job: 'System analyst &\n Documentation\n Writer',
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
        _buildDivider(context),
      ],
    );
  }
}
SizedBox _buildDivider(BuildContext context) {
  return SizedBox(
    height: context.deviceHeight * 0.04,
    // width: context.deviceWidth * 0.02,
  );
}
