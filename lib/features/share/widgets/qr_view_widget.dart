// import 'dart:convert';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
// import 'package:speech_emotion_recognition_project/features/share/widgets/scanned_user_view_widget.dart';
//
// import '../controller/followed_cubit.dart';
//
// class QRScreen extends StatefulWidget {
//   const QRScreen({super.key,required this.cubit});
//  final FollowedCubit cubit;
//   @override
//   State<QRScreen> createState() => _QRScreenState();
// }
//
// class _QRScreenState extends State<QRScreen> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   Barcode? result;
//   QRViewController? controller;
//
//   // In order to get hot reload to work we need to pause the camera if the platform
//   // is android, or resume the camera if the platform is iOS.
//   @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller!.pauseCamera();
//     } else if (Platform.isIOS) {
//       controller!.resumeCamera();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       body: QRView(
//         key: qrKey,
//         onQRViewCreated: (QRViewController controller) {
//           this.controller = controller;
//           controller.scannedDataStream.listen((scanData) {
//
//
//             result = scanData;
//             Map j = const JsonDecoder().convert(result!.code!);
//             Navigator.pop(context);
//             showDialog(
//                 context: context,
//                 builder: (_) => ScannedUserViewWidget(
//                   image: j['userImage'],
//                   userName: j['userName'],
//                   userEmail: j['userEmail'],
//                   token: j['token'],
//                   cubit: widget.cubit,
//                 ));
//
//           });
//         },
//       ),
//     );
//   }
//
//
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
// }
