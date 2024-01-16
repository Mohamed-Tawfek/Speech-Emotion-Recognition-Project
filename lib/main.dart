import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();


  runApp(EasyLocalization(
      supportedLocales: const [ Locale('ar'),Locale('en')],
      path: 'assets/langs',
      fallbackLocale: const Locale('en'),

      child: const MyApp()));
}
