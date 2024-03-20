import 'dart:convert';

import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';

import 'core/constants/dark_theme_colors.dart';
import 'core/constants/light_theme_colors.dart';
import 'features/share/controller/followed_cubit.dart';
import 'features/share/widgets/scanned_user_view_widget.dart';
import 'modes_controller/modes_cubit.dart';



class TestAIQrCode extends StatefulWidget {
  const TestAIQrCode({Key? key, required this.cubit}) : super(key: key);
  final FollowedCubit cubit;

  @override
  State<TestAIQrCode> createState() => _TestAIQrCodeState();
}

class _TestAIQrCodeState extends State<TestAIQrCode> {


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
              cubit: widget.cubit,
            ));
      },
      onDetect: (p0) {},
      onDispose: () {
        debugPrint("Barcode scanner disposed!");
      },
      controller: MobileScannerController(
        detectionSpeed: DetectionSpeed.noDuplicates,
      ),
    );
  }
}