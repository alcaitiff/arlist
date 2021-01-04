import 'package:flutter/material.dart';
import 'package:ar_list/theme/style.dart';
import 'package:ar_list/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ARListApp());
}

class ARListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English, no country code
        const Locale('pt', ''), // Portuguese
      ],
      title: 'ARListApp',
      theme: ThemeManager.lightTheme(),
      initialRoute: '/',
      routes: routes,
    );
  }
}
