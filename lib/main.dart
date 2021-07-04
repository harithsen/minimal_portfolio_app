import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minimal_portfolio_webapp/services/routes.dart';
import 'package:minimal_portfolio_webapp/widgets/theme_data.dart';
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

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: "Harith Wickramasingha",
      theme: themeProvider.getThemeData,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}
