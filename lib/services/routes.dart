import 'package:flutter/material.dart';
import 'package:minimal_portfolio_webapp/screens/about/about.dart';
import 'package:minimal_portfolio_webapp/screens/blog/blog.dart';
import 'package:minimal_portfolio_webapp/screens/books/books.dart';
import 'package:minimal_portfolio_webapp/screens/home/home.dart';
import 'package:minimal_portfolio_webapp/screens/projects/projects.dart';

var appRoutes = <String, WidgetBuilder>{
  HomeScreen.routeName: (context) => HomeScreen(),
  AboutMe.routeName: (context) => AboutMe(),
  Projects.routeName: (context) => Projects(),
  Books.routeName: (context) => Books(),
  Blog.routeName: (context) => Blog(),
};
