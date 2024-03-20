import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/core/constants/dark_theme_colors.dart';
import 'package:speech_emotion_recognition_project/core/constants/light_theme_colors.dart';
import 'package:speech_emotion_recognition_project/features/share/controller/followed_cubit.dart';

import '../../../modes_controller/modes_cubit.dart';
import '../../../test_qr.dart';
import '../../history/screens/history_screen.dart';
import '../model/followed_model.dart';
import '../widgets/qr_view_widget.dart';

class FollowScreen extends StatelessWidget {
  const FollowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool appMode = AppModeCubit.get(context).isDark;
    FollowedCubit? followedCubit;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: appMode ? DarkColors.primary : LightColors.primary,
        onPressed: () {
          // context.push(QRScreen(
          //   cubit: followedCubit!,
          //   ));
          context.push(TestAIQrCode(cubit: followedCubit!,));
        },
        child: Icon(
          Icons.add,
          color: appMode ? DarkColors.scaffoldColor : LightColors.scaffoldColor,
        ),
      ),
      body: BlocProvider(
        create: (context) => FollowedCubit()..getFollowed(),
        child: BlocBuilder<FollowedCubit, FollowedState>(
          builder: (context, state) {
            FollowedCubit cubit = FollowedCubit.get(context);
            followedCubit = cubit;
            if (cubit.followed.isEmpty) {
              return Container();
            } else {
              return ListView.separated(
                  itemBuilder: (_, index) {
                    FollowedModel currentFollowed = cubit.followed[index];
                    return Dismissible(

                      background: const Icon(Icons.delete),
                      onDismissed: (DismissDirection direction) {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  title: Text(
                                    'Are you sure to delete?'.tr(),
                                    style: TextStyle(
                                        color: appMode
                                            ? DarkColors.textColor
                                            : LightColors.textColor,
                                        fontSize: 15.sp),
                                  ),
                                  actions: [
                                    MaterialButton(
                                      color: appMode
                                          ? DarkColors.primary
                                          : LightColors.primary,
                                      onPressed: () {
                                        cubit.removeFollowed(
                                            index: index, context: context);
                                      },
                                      child: Text(
                                        'Yes'.tr(),
                                        style: TextStyle(
                                            color: appMode
                                                ? DarkColors.scaffoldColor
                                                : LightColors.scaffoldColor,
                                            fontSize: 10.sp),
                                      ),
                                    ),
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        cubit.getFollowed();
                                      },
                                      child: Text('No'.tr(),
                                          style: TextStyle(
                                              color: appMode
                                                  ? DarkColors.textColor
                                                  : LightColors.textColor,
                                              fontSize: 10.sp)),
                                    ),
                                  ],
                                ));
                      },
                      key: UniqueKey(),
                      child: ViewFollowedWidget(
                        model: currentFollowed,
                      ),
                    );
                  },
                  separatorBuilder: (_, i) {
                    return Padding(
                      padding: EdgeInsetsDirectional.symmetric(
                          horizontal: context.deviceWidth * 0.1,
                          vertical: context.deviceHeight * 0.001),
                      child: Container(
                        height: 0.3,
                        color: Colors.black,
                        width: double.infinity,
                      ),
                    );
                  },
                  itemCount: cubit.followed.length);
            }
          },
        ),
      ),
    );
  }
}

class ViewFollowedWidget extends StatelessWidget {
  const ViewFollowedWidget({
    super.key,
    required this.model,
  });

  final FollowedModel model;

  @override
  Widget build(BuildContext context) {
    bool appMode = AppModeCubit.get(context).isDark;

    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(model.userImage),
      ),
      titleAlignment: ListTileTitleAlignment.center,
      title: Text(model.userName,
      style: TextStyle(
        color: appMode ? DarkColors.textColor : LightColors.textColor
      ),

      ),
      subtitle: Text(model.userEmail,   style: TextStyle(
          color: appMode ? DarkColors.subtitleColor : LightColors.subtitleColor
      ),),
      onTap: () {
        context.push(HistoryScreen(
          forDisplaySharing: true,
          model: model,
        ));
      },
    );
  }
}

class SynchronizingWidget extends StatefulWidget {
  const SynchronizingWidget({super.key});

  @override
  State<SynchronizingWidget> createState() => _SynchronizingWidgetState();
}

class _SynchronizingWidgetState extends State<SynchronizingWidget> {
  double value = 0.0;
  increaseValue() {
    {
      if (value < 1.0) {
        setState(() {
          value = value + 0.0009;
        });

        Future.delayed(const Duration(microseconds: 1)).then((value) {
          increaseValue();
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    increaseValue();
    print(value);
    if (value >= 1.0) {
      //  Navigator.pop(context);

      context.pop();
    }
    bool appMode = AppModeCubit.get(context).isDark;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Synchronizing',
          style: TextStyle(
            fontSize: 13.sp,
            color: appMode ? DarkColors.textColor : LightColors.textColor,
          ),
        ),
        SizedBox(
          height: context.deviceHeight * 0.02,
        ),
        LinearProgressIndicator(
          value: value,
          color: appMode ? DarkColors.primary : LightColors.primary,
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
