import 'package:flutter/material.dart';
import 'package:ar_list/theme/style.dart';
import 'package:ar_list/routes.dart';

void main() {
  runApp(ARListApp());
}

class ARListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ARListApp',
      theme: ThemeManager.lightTheme(),
      initialRoute: '/',
      routes: routes,
    );
  }
}
