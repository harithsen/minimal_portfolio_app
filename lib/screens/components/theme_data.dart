import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  bool isLightTheme;

  ThemeProvider({this.isLightTheme});

  ThemeData get getThemeData => isLightTheme ? darkTheme : lightTheme;

  setThemeData() async {
    final prefs = await SharedPreferences.getInstance();
    isLightTheme = !isLightTheme;
    prefs.setBool('lightTheme', isLightTheme);
    notifyListeners();
  }
}

final lightTheme = ThemeData(
  appBarTheme: AppBarTheme(color: Colors.white12),
  brightness: Brightness.dark,
  primarySwatch: Colors.teal,
  //accentColor: Colors.teal,
  iconTheme: IconThemeData(color: Colors.black87),
  textTheme: TextTheme(
    headline5: GoogleFonts.aBeeZee(
        color: Colors.white, fontWeight: FontWeight.w900, letterSpacing: 1.5),
    headline6: GoogleFonts.aBeeZee(
      color: Colors.deepOrange,
    ),
    bodyText1: GoogleFonts.aBeeZee(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white70,
        letterSpacing: 1),
    bodyText2: GoogleFonts.aBeeZee(
      color: Colors.white,
      letterSpacing: 0.7,
    ),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

final darkTheme = ThemeData(
  primarySwatch: Colors.teal,
  inputDecorationTheme: InputDecorationTheme(
    //border: OutlineInputBorder(),
    labelStyle: TextStyle(color: Colors.deepOrange, fontSize: 24.0),
  ),
  iconTheme: IconThemeData(color: Colors.lightBlue),
  appBarTheme: AppBarTheme(
    color: Colors.white,
    iconTheme: IconThemeData(color: Colors.teal),
  ),
  accentColor: Colors.teal,
  textTheme: TextTheme(
    headline5: GoogleFonts.aBeeZee(
        color: Colors.black87, fontWeight: FontWeight.w900, letterSpacing: 1.5),
    headline6: GoogleFonts.aBeeZee(
      color: Colors.deepOrange,
    ),
    bodyText1: GoogleFonts.aBeeZee(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.blueGrey,
        letterSpacing: 1),
    bodyText2: GoogleFonts.aBeeZee(
      color: Colors.grey[600],
      letterSpacing: 0.7,
    ),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
