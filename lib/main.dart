import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minimal_portfolio_webapp/screens/about/about.dart';
import 'package:minimal_portfolio_webapp/screens/books/books.dart';
import 'package:minimal_portfolio_webapp/screens/components/theme_data.dart';
import 'package:minimal_portfolio_webapp/screens/home/home.dart';
import 'package:minimal_portfolio_webapp/screens/projects/projects.dart';
import 'package:minimal_portfolio_webapp/screens/blog/blog.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  bool isLightTheme = prefs.getBool('lightTheme') ?? true;
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(
            ChangeNotifierProvider(
              create: (_) {
                return ThemeProvider(isLightTheme: isLightTheme);
              },
              child: MyApp(),
            ),
          ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: "Harith Wickramasingha",
      theme: themeProvider.getThemeData,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        AboutMe.routeName: (context) => AboutMe(),
        Projects.routeName: (context) => Projects(),
        Books.routeName: (context) => Books(),
        //BlogArticle.routeName: (context) => BlogArticle(),
        Blog.routeName: (context) => Blog(),
      },
    );
  }
}
