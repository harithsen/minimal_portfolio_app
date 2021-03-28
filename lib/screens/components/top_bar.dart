import 'package:flutter/material.dart';
import 'package:minimal_portfolio_webapp/screens/components/dark_mode_switch.dart';
import 'package:minimal_portfolio_webapp/screens/components/theme_data.dart';
import 'package:provider/provider.dart';

class TopBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [SwitchDarkLightMode(themeProvider: themeProvider)],
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
