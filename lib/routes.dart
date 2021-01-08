import 'package:flutter/widgets.dart';
import 'package:ar_list/screens/home/home.dart';
import 'package:ar_list/screens/create/create.dart';
import 'package:ar_list/screens/rename/rename.dart';
import 'package:ar_list/screens/detail/detail.dart';
import 'package:ar_list/screens/add/add.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => HomeScreen(),
  "/create": (BuildContext context) => CreateScreen(),
  "/rename": (BuildContext context) => RenameScreen(),
  "/detail": (BuildContext context) => DetailScreen(),
  "/add": (BuildContext context) => AddScreen(),
};
