import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minimal_portfolio_webapp/screens/components/theme_data.dart';
import 'package:minimal_portfolio_webapp/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
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
        theme: themeProvider.getThemeData,
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}
