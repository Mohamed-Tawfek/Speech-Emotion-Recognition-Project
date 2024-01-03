import 'package:flutter/material.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';

import '../controller/month_cubit/month_cubit.dart';

class BuildSelectionBar extends StatelessWidget {
  const BuildSelectionBar({super.key, required this.cubit});
  final MonthCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SelectionBtn(
          isChosen: cubit.selectionPart == 1,
          number: 1,
        ),
        SizedBox(
          width: context.deviceWidth * 0.04,
        ),
        SelectionBtn(
          isChosen: cubit.selectionPart == 2,
          number: 2,
        ),
        SizedBox(
          width: context.deviceWidth * 0.04,
        ),
        SelectionBtn(
          isChosen: cubit.selectionPart == 3,
          number: 3,
        ),
      ],
    );
  }
}

class SelectionBtn extends StatelessWidget {
  const SelectionBtn({super.key, required this.isChosen, required this.number});

  final int number;
  final bool isChosen;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        MonthCubit.get(context).changeSelectionInMonth(number);
      },
      child: Container(
          padding: const EdgeInsetsDirectional.all(10),
          decoration: BoxDecoration(
              color: isChosen ? const Color(0xffEF5794) : Colors.grey[100],
              borderRadius: BorderRadius.circular(5)),
          child: Text(
            number.toString(),
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isChosen ? Colors.white : Colors.black),
          )),
    );
  }
}
