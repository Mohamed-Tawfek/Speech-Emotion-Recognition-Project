import 'dart:convert';

import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:speech_emotion_recognition_project/features/share/widgets/scanned_user_view_widget.dart';

import '../../../core/constants/dark_theme_colors.dart';
import '../../../core/constants/light_theme_colors.dart';
import '../../../modes_controller/modes_cubit.dart';
import '../controller/followed_cubit.dart';



class QRScanner extends StatefulWidget {
  const QRScanner({Key? key, required this.cubit}) : super(key: key);
  final FollowedCubit cubit;

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {


  @override
  Widget build(BuildContext context) {
    bool appMode = AppModeCubit.get(context).isDark;

    return AiBarcodeScanner(
      borderColor: appMode ? DarkColors.primary : LightColors.primary,
      bottomBar: const SizedBox(),
      validator: (value) {
        return  true;
      },
      canPop: false,

      onScan: (String value) {

        Map j = const JsonDecoder().convert(value);
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: (_) => ScannedUserViewWidget(
              image: j['userImage'],
              userName: j['userName'],
              userEmail: j['userEmail'],
              token: j['token'],
              userID: j['userID'],
              cubit: widget.cubit,
            ));
      },
      onDetect: (BarcodeCapture p0) {
  
      },
      onDispose: () {
        debugPrint("Barcode scanner disposed!");
      },
      controller: MobileScannerController(
        detectionSpeed: DetectionSpeed.noDuplicates,
      ),
    );
  }
}