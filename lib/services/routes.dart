import 'package:flutter/material.dart';
import "../screens/screens_export.dart";

var appRoutes = <String, WidgetBuilder>{
  HomeScreen.routeName: (context) => HomeScreen(),
  AboutMe.routeName: (context) => AboutMe(),
  Projects.routeName: (context) => Projects(),
  Books.routeName: (context) => Books(),
  Design.routeName: (context) => Design(),
};
