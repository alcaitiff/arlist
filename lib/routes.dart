import 'package:flutter/widgets.dart';
import 'package:ar_list/screens/home/home.dart';
import 'package:ar_list/screens/create/create.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => HomeScreen(),
  "/create": (BuildContext context) => CreateScreen(),
};
