import 'package:easy_localization/easy_localization.dart';
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
