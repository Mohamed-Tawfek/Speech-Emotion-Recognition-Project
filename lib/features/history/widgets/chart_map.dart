
import 'package:flutter/material.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';

class BuildChartMap extends StatelessWidget {
  const BuildChartMap({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.deviceWidth,
      child: const Center(
        child: Wrap(
          children: [
            MapItem(text: 'Angery', color: Colors.red),
            SizedBox(
              width: 10,
              height: 20,
            ),
            MapItem(text: 'Happy', color: Colors.yellow),
            SizedBox(
              width: 10,
              height: 20,
            ),
            MapItem(text: 'Normal', color: Colors.green),
            SizedBox(
              width: 10,
              height: 20,
            ),
            MapItem(text: 'Sad', color: Colors.purple),
          ],
        ),
      ),
    );
  }
}

class MapItem extends StatelessWidget {
  const MapItem({super.key, required this.color, required this.text});
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: color,
              height: 20,
              width: 20,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(text),
          ],
        ),
      ],
    );
  }
}