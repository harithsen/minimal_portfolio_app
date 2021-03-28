import 'package:flutter/material.dart';
import 'package:minimal_portfolio_webapp/screens/components/theme_data.dart';

class SwitchDarkLightMode extends StatelessWidget {
  const SwitchDarkLightMode({
    Key key,
    @required this.themeProvider,
  }) : super(key: key);

  final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(Icons.nights_stay),
          Switch(
            activeColor: Colors.white,
            activeTrackColor: Colors.deepOrangeAccent,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.grey,
            value: themeProvider.isLightTheme,
            onChanged: (val) {
              themeProvider.setThemeData();
            },
          ),
          Icon(
            Icons.wb_sunny_outlined,
          ),
        ],
      ),
    );
  }
}
