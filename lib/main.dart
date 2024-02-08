import 'package:ar_list/routes.dart';
import 'package:ar_list/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'generated/l10n.dart';

void main() {
  runApp(ProviderScope(child: ARListApp()));
}

class ARListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'ARListApp',
      theme: ThemeManager.lightTheme(),
      initialRoute: '/',
      routes: routes,
    ));
  }
}
