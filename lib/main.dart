import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: const [ Locale('ar'),Locale('en')],
      path: 'assets/langs', // <-- change the path of the translation files
      fallbackLocale: Locale('en'),

      child: const MyApp()));
}
